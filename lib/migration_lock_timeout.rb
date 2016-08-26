require 'rails'
require 'active_record'
require 'migration_lock_timeout/version'
require 'migration_lock_timeout/lock_manager'
require 'migration_lock_timeout/config'

module MigrationLockTimeout
  ::ActiveRecord::Migration.prepend(MigrationLockTimeout::LockManager)
end
