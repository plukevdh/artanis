require_relative "response_handlers"

module Artanis
  class Config
    MissingConfigError = Class.new(StandardError)
    InvalidHandler = Class.new(StandardError)

    REQUIRED_KEYS = %w[endpoint]

    attr_accessor *REQUIRED_KEYS

    def self.setup(&block)
      config = self.new
      yield config if block_given?

      REQUIRED_KEYS.each do |key|
        next unless config.send(key).nil?

        begin
          config.send "#{key}=", config.fetch!(key)
        rescue KeyError
          raise MissingConfigError, "Missing config value for #{key.upcase}. Please set this value in the environment."
        end
      end

      config
    end

    def default_handler=(handler)
      raise InvalidHandler unless handler.new.respond_to? :parse
      @default_handler = handler
    end

    def default_handler
      @default_handler || ResponseHandlers::NullHandler
    end

    def fetch(key)
      ENV[key.upcase]
    end

    # Fails with KeyError if required
    def fetch!(key)
      ENV.fetch(key.upcase)
    end
  end
end
