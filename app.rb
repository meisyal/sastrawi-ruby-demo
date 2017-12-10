require 'sastrawi'
require 'sinatra'

before do
  stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new
  @stemmer = stemmer_factory.create_stemmer
end

get '/' do
  erb :index, :locals => {:result => nil}
end

post '/' do
  start_time = Time.now
  stemming_result = stem(params['input'])
  end_time = Time.now

  elapsed_time = end_time - start_time

  erb :index, :locals => {:result => stemming_result, :time => elapsed_time}
end

def stem(text)
  stemming_result = @stemmer.stem(text)

  stemming_result
end
