require 'sastrawi'
require 'sinatra'
require 'sinatra/reloader' if development?

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

  if @text.length > 3500
    erb :index, :locals => {:result => "Text is too long, please download the offline version of sastrawi-ruby instead.", :time => nil}
  else
    start_time = Time.now
    stemming_result = stem(@text)
    end_time = Time.now

    elapsed_time = end_time - start_time

    erb :index, :locals => {:result => stemming_result, :time => elapsed_time}
  end
end

def stem(text)
  stemming_result = @stemmer.stem(text)

  stemming_result
end
