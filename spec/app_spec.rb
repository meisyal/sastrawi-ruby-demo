ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rspec'
require 'rack/test'

describe 'Sastrawi Ruby Demo' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end
