module MigrationLockTimeout
  module LockManager

    def migrate
      if (MigrationLockTimeout.default_timeout)
        execute "SET LOCAL lock_timeout = '#{MigrationLockTimeout.default_timeout}s'"
      end
      self
    end
  end
end
