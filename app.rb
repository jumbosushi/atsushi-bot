require 'sinatra'

get '/' do
  'Hello world!'
end

post '/' do
  'This message is returned', 200
end
