module MigrationLockTimeout
  module LockManager

    def migrate(direction)
      timeout_disabled = self.class.disable_lock_timeout
      time = self.class.lock_timeout_override ||
        MigrationLockTimeout.try(:config).try(:default_timeout)
      if !timeout_disabled && direction == :up && time && !disable_ddl_transaction
        safety_assured? do
          execute "SET LOCAL lock_timeout = '#{time}s'"
        end
      end
      super
    end

    def safety_assured?
      if defined?(StrongMigrations)
        safety_assured { yield }
      else
        yield
      end
    end
  end
end
