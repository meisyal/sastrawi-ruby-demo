require 'sinatra'
require 'sastrawi'

get '/' do
  erb :index
end

post '/' do
  stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new
  stemmer = stemmer_factory.create_stemmer
  stemming_result = stemmer.stem(params['input'])

  "Stemming result: #{stemming_result}"
end
