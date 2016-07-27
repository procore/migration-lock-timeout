module MigrationLockTimeout
  mattr_accessor :config

  def self.configure
    @@config = Configurator.new
    yield @@config
  end

  class Configurator
    attr_accessor :default_timeout

    def initialize
      @default_timeout = nil
    end

  end

end
