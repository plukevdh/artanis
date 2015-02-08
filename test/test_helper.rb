require 'minitest/autorun'
require 'minitest/reporters'

require './lib/artanis'

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

def config
  Artanis::Config.setup do |c|
    c.endpoint = "https://api.github.com"
  end
end
