require 'sastrawi'
require 'sinatra'

get '/' do
  erb :index, :locals => {:result => "-"}
end

post '/' do
  stemming_result = stem(params['input'])

  erb :index, :locals => {:result => stemming_result}
end

def stem(text)
  stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new
  stemmer = stemmer_factory.create_stemmer
  stemming_result = stemmer.stem(text)

  stemming_result
end
