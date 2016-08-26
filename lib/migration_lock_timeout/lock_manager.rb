module MigrationLockTimeout
  module LockManager

    def migrate(direction)
      timeout_disabled = self.class.disable_lock_timeout
      time = self.class.lock_timeout_override || 
        MigrationLockTimeout.try(:config).try(:default_timeout)
      if !timeout_disabled && direction == :up && time && !disable_ddl_transaction
        execute "SET LOCAL lock_timeout = '#{time}s'"
      end
      super
    end
  end
end
