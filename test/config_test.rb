require './test/test_helper'

describe Artanis::Config do
  describe "with block" do
    it "should have an endpoint set" do
      assert "https://api.github.com/", config.endpoint
    end

    it "should require an endpoint" do
      assert_raises Artanis::Config::MissingConfigError do
        Artanis::Config.setup
      end
    end
  end
end
