require 'sastrawi'
require 'sinatra'

before do
  stemmer_factory = Sastrawi::Stemmer::StemmerFactory.new
  @stemmer = stemmer_factory.create_stemmer
end

get '/' do
  erb :index, :locals => {:result => "-"}
end

post '/' do
  stemming_result = stem(params['input'])

  erb :index, :locals => {:result => stemming_result}
end

def stem(text)
  stemming_result = @stemmer.stem(text)

  stemming_result
end
