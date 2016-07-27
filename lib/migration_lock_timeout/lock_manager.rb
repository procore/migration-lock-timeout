module MigrationLockTimeout
  class LockManager

    def migrate
      if (MigrationLockTimeout.default_timeout)
        execute "SET LOCAL lock_timeout = '#{MigrationLockTimeout.default_timeout}s'"
      end
    end
  end
end
