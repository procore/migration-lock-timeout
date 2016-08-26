module MigrationLockTimeout
  module LockManager

    def migrate(direction)
      if direction == :up && MigrationLockTimeout.try(:config).try(:default_timeout)
        execute "SET LOCAL lock_timeout = '#{MigrationLockTimeout.config.default_timeout}s'"
      end
      self
    end
  end
end
