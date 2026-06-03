require "simplecov"
require "simplecov-console"
require "roda"

if ENV["COVERAGE"]
  SimpleCov.start {
    enable_coverage :branch
  }
end

require "paginacion"
require "rack/test"

RSpec.configure { |config|
  config.include Rack::Test::Methods
}
