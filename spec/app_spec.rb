ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'

require_relative '../app'

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

    context 'with method POST' do
      before do
        post '/', {'input' => 'Perekonomian Indonesia sedang dalam pertumbuhan yang sangat membanggakan'}
      end

      it 'responds successfully' do
        expect(last_response.status).to eq(200)
      end

      long_text = 'Teks ini memiliki jumlah karakter lebih dari 2500'

      before do
        post '/', {'input' => long_text}
      end

      it 'responds to download the offline version off sastrawi-ruby' do
        expect(last_response.status).to eq(200)
      end
    end
  end
end
