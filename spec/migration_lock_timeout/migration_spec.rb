require './spec_helper'
require 'active_record'
require_relative '../../lib/migration_lock_timeout'

RSpec.describe ActiveRecord::Migration do

  describe '#migrate' do

    class AddFoo < ActiveRecord::Migration
      def change
        create_table :foo do |t|
          t.timestamps
        end
      end
    end

    before(:each) do
      MigrationLockTimeout.configure do |config|
        config.default_timeout = 5
      end
    end

    it 'runs migrate up with timeout' do
      migration = AddFoo.new
      expect(ActiveRecord::Base.connection).to receive(:execute).
        with("SET LOCAL lock_timeout = '5s'")
      migration.migrate(:up)
    end

    it 'allows migration to run if no default timeout set' do
      MigrationLockTimeout.config = nil
      migration = AddFoo.new
      migration.migrate(:up)
    end
  end
end
