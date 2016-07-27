require "migration_lock_timeout/version"
require "migration_lock_timeout/lock_manager"
require "migration_lock_timeout/config"

module MigrationLockTimeout
  ActiveRecord::Migrator.prepend(LockManager)
end
