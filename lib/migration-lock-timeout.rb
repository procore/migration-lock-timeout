require 'active_record'

module MigrationLockTimeout
end

Dir[File.join(File.dirname(__FILE__), 'migration_lock_timeout', '*.rb')].each {|file| require file }

::ActiveRecord::Migration.prepend(MigrationLockTimeout::LockManager)
::ActiveRecord::Migration.extend(MigrationLockTimeout::MigrationExtensions)
