require 'http'
require 'active_support/concern'

module Artanis
  module Client
    extend ActiveSupport::Concern
    include HTTP::Chainable

    class_methods do
      def setup(&block)
        new Artanis::Config.setup(&block)
      end
    end

    attr_reader :config

    def initialize(config=Artanis::Config.setup)
      @config = config
    end

    private

    def build_request(path)
      base = URI.join @config.endpoint, path
      path = @config.endpoint + base.path + ".json"


      path += "?" + base.query if base.query

      path
    end
  end
end
