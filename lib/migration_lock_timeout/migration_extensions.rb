module MigrationLockTimeout
  module MigrationExtensions
    attr_accessor :disable_lock_timeout

    def disable_lock_timeout!
      self.disable_lock_timeout = true
    end
  end
end
