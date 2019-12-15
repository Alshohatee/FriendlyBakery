require "sinatra"
# require  "httparty"
require "curb"
# require 'sinatra/reloader' if development?
set :port, 3000
require './cake.rb'
require './muffin.rb'
require './cookie.rb'

@@path = "https://api.edamam.com/search"

get '/' do
  erb :index
end

# here to go to the specific page
get '/cookie' do
  @fo ="cookie"
  @num = 24
  @id = ENV['API_EDAMAM_ID']
  @key = ENV['API_EDAMAM_KEY']
  @ingredientLines = []
  @arr = []

  req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{@id}&app_key=#{@key}&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)

  i = 0
  while i < @num
    @data = res['hits'][i]["recipe"]

    @data["ingredientLines"].each do |y|
      @ingredientLines << y
    end

    @cookie = Cookie.new(i,@data["label"], @data["image"],@ingredientLines, 2 )
    @arr << @cookie
    i += 1
  end
  erb :cookie
end

get '/muffin' do
  @fo ="muffin"
  @num = 24
  @id = ENV['API_EDAMAM_ID']
  @key = ENV['API_EDAMAM_KEY']
  @ingredientLines = []
  @arr = []

  req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{@id}&app_key=#{@key}&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)

  i = 0
  while i < @num
    @data = res['hits'][i]["recipe"]

    @data["ingredientLines"].each do |y|
      @ingredientLines << y
    end

    @muffin = Muffin.new(i,@data["label"], @data["image"],@ingredientLines, 2 )
    @arr << @muffin
    i += 1
  end
  erb :muffin
end

get '/cake' do
  fo ="cake"
  @num = 24
  @id = ENV['API_EDAMAM_ID']
  @key = ENV['API_EDAMAM_KEY']
  @ingredientLines = []
  @arr = []

  req = Curl::Easy.perform(@@path + "?q=#{fo}&app_id=#{@id}&app_key=#{@key}&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)

  i = 0
  while i < @num
    @data = res['hits'][i]["recipe"]

    @data["ingredientLines"].each do |y|
      @ingredientLines << y
    end

    @cake = Cake.new(i,@data["label"], @data["image"],@ingredientLines, 2 )
    @arr<< @cake
    i += 1
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
