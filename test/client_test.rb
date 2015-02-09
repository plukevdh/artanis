require './test/test_helper'

describe Artanis::Client do
  class GithubClient
    include Artanis::Client
  end

  METHODS = %i[get post put delete patch]   # ... and more

  let(:demo) { GithubClient.new(build_config) }
  let(:url) { "https://api.github.com" }

  describe "client" do
    it "can call setup to do config" do
      cl = GithubClient.setup do |c|
        c.endpoint = url
      end

      assert_instance_of GithubClient, cl
      assert_instance_of Artanis::Config, cl.config
      assert_equal url, cl.config.endpoint
    end

    it "generates raw request client" do
      METHODS.each do |method|
        assert_respond_to demo, method
      end
    end

    it "creates the full url for requests" do
      assert_equal (url + "/users"), demo.send(:build_uri, "/users")
    end
  end

end
