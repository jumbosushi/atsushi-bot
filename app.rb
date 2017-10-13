require 'sinatra'

get '/' do
  'Hello world!'
end

post '/' do
  puts request.text
  puts params
  status 200
  'This message is returned'
end
