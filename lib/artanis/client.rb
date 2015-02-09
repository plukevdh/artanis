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

    attr_reader :config, :handler

    def initialize(config=Artanis::Config.setup)
      @config = config
      @handler = config.default_handler.new
    end

    def request(verb, uri, opts = {}, response_handler=handler)
      uri = build_uri(uri)

      response_handler.parse super
    end

    private

    def build_uri(path)
      URI.join(@config.endpoint, path).to_s
    end
  end
end
