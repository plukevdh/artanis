module Artanis
  class Config
    MissingConfigError = Class.new(StandardError)

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

    def fetch(key)
      ENV[key.upcase]
    end

    # Fails with KeyError if required
    def fetch!(key)
      ENV.fetch(key.upcase)
    end
  end
end
