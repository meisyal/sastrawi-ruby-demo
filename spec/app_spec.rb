ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rspec'
require 'rack/test'

describe 'Sastrawi Ruby Demo' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '/' do
    context 'with method GET' do
      before do
        get '/'
      end

      it 'responds successfully' do
        expect(last_response.status).to eq(200)
      end
    end
  end
end
