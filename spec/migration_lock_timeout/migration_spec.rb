require 'active_record'

RSpec.describe ActiveRecord::Migration do

  before(:all) do
    ActiveRecord::Base.establish_connection(
      adapter: "postgresql",
      database: "migration_lock_timeout_test",
      username: 'procore_db',
      password: ENV['POSTGRES_DB_PASSWORD'],
      host: 'localhost'
    )
    @conn = ActiveRecord::Base.connection
  end


  describe '#migrate' do

    class AddFoo < ActiveRecord::Migration
      def change
        create_table :foo do |t|
          t.timestamps
        end
      end
    end

    it 'runs migrate' do
      migration = AddFoo.new
      migration.exec_migration(@conn, :up)
    end
  end
end
