require "sinatra"
require  "httparty"
require 'sinatra/reloader' if development?
set :port, 3000

get '/' do
  "heloo"
  erb :layout
end





# here to go to the specific page
get '/cookie' do
  "heloo"
  erb :cookie
end

get '/muffin' do
  "heloo"
  erb :muffin
end

get '/cake' do
  "heloo"
  erb :cake
end
