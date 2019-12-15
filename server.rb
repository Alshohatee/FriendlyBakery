require "sinatra"
# require  "httparty"
require "curb"
# require 'sinatra/reloader' if development?
set :port, 3000

@@path = "https://api.edamam.com/search"
# get '/' do
#   erb :index
# end
# @fo ="cake"
# @n = 12
# id = ENV['API_EDAMAM_ID']
# key = ENV['API_EDAMAM_KEY']
# req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{id}&app_key=#{key}&from=0&to=#{@n}&calories=591-722&health=alcohol-free")
# res = JSON.parse(req.body)
# @arr = []
# x = 0
# while x < @n
#   @data = res['hits'][x]["recipe"]
#   @arr << @data
#   x += 1
# end
get '/' do
  erb :index
end
# here to go to the specific page
get '/cookie' do
  @fo ="cookie"
  @n = 12
  id = ENV['API_EDAMAM_ID']
  key = ENV['API_EDAMAM_KEY']
  req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{id}&app_key=#{key}&from=0&to=#{@n}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)
  @arr = []
  x = 0
  while x < @n
    @data = res['hits'][x]["recipe"]
    @arr << @data
    x += 1
  end
  erb :cookie
end

get '/muffin' do
  @fo ="muffin"
  @n = 12
  id = ENV['API_EDAMAM_ID']
  key = ENV['API_EDAMAM_KEY']
  req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{id}&app_key=#{key}&from=0&to=#{@n}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)
  @arr = []
  x = 0
  while x < @n
    @data = res['hits'][x]["recipe"]
    @arr << @data
    x += 1
  end
  erb :muffin
end

get '/cake' do
  @fo ="cake"
  @n = 12
  id = ENV['API_EDAMAM_ID']
  key = ENV['API_EDAMAM_KEY']
  req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{id}&app_key=#{key}&from=0&to=#{@n}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)
  @arr = []
  x = 0
  while x < @n
    @data = res['hits'][x]["recipe"]
    @arr << @data
    x += 1
  end
  erb :cake
end

post '/' do
  @food = params['food']
  @num = params['to'].to_i
  id = ENV['API_EDAMAM_ID']
  key = ENV['API_EDAMAM_KEY']
  req = Curl::Easy.perform(@@path + "?q=#{@food}&app_id=#{id}&app_key=#{key}&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)
  @arr = []
  x = 0
  while x < @num
    @data = res['hits'][x]["recipe"]
    @arr << @data
    x += 1
  end
  erb :index
end
# <!-- <h1>Cookie</h1>
# <% if (!(@arr.nil?)) %>
# <div id="grid-container">
#   <% @arr.each do |x| %>
#   <div id="grid-item">
#     <p> <%= x["label"] %> </p>
#     <img src ="<%= x["image"]%>">
#     <% x["ingredientLines"].each do |y|%>>
#     <p><%= y%></p>
#     <% end %>
#   </div>
#   <% end %>
#
# </div>
# <% end %> -->
