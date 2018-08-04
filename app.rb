require 'sastrawi'
require 'sinatra'
require 'sinatra/reloader' if development?

require_relative 'app_config'

set :erb, { escape_html: true }

before do
  stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new
  @stemmer = stemmer_factory.create_stemmer
end

get '/' do
  erb :index, :locals => {:result => nil}
end

post '/' do
  @text = params['input']

  if @text.length > MAX_TEXT_LONG_CHARACTER
    erb :index, :locals => {:result => OFFLINE_VERSION_INFO, :time => nil}
  else
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    stemming_result = stem(@text)
    end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed_time = end_time - start_time

    erb :index, :locals => {:result => stemming_result, :time => elapsed_time}
  end
end

def stem(text)
  stemming_result = @stemmer.stem(text)

  stemming_result
end
