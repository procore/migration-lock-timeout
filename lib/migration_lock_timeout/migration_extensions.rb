module MigrationLockTimeout
  module MigrationExtensions
    attr_accessor :disable_lock_timeout
    attr_accessor :lock_timeout_override

    def disable_lock_timeout!
      self.disable_lock_timeout = true
    end

    def set_lock_timeout(seconds)
      self.lock_timeout_override = seconds
    end
  end
end
