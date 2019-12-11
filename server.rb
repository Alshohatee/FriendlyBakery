require "sinatra"
require  "httparty"
set :port, 3000

get '/' do
  "heloo"
  erb :index
end
