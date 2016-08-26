module MigrationLockTimeout
  module LockManager

    def migrate(direction)
      timeout_disabled = self.class.disable_lock_timeout
      if !timeout_disabled && direction == :up && MigrationLockTimeout.try(:config).try(:default_timeout)
        execute "SET LOCAL lock_timeout = '#{MigrationLockTimeout.config.default_timeout}s'"
      end
      self
    end
  end
end
