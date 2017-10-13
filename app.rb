require 'sinatra'

get '/' do
  'Hello world!'
end

post '/' do
  puts request.to_s
  puts params
  status 200
  'This message is returned'
end
