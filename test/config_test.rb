require './test/test_helper'

describe Artanis::Config do
  describe "with block" do
    it "should have an endpoint set" do
      assert "https://api.github.com/", build_config.endpoint
    end

    it "should require an endpoint" do
      assert_raises Artanis::Config::MissingConfigError do
        Artanis::Config.setup
      end
    end

    describe "response handlers" do
      it "should have a default handler" do
        assert_equal Artanis::ResponseHandlers::NullHandler, build_config.default_handler
      end

      it "checks default handlers for 'parse' method" do
        HandleIt = Class.new

        assert_raises Artanis::Config::InvalidHandler do
          build_config.default_handler = HandleIt
        end
      end

      it "can set the default handler" do
        config = build_config
        class HandleIt
          def parse(data) ; end
        end

        config.default_handler = HandleIt
        assert_equal HandleIt, config.default_handler
      end
    end
  end
end
