require "sinatra"
# require  "httparty"
require "curb"
# require 'sinatra/reloader' if development?
set :port, 3000
require './cake.rb'
require './muffin.rb'
require './cookie.rb'
require 'twilio-ruby'

def h(text)
  Rack::Utils.escape_html(text)
end

@@path = "https://api.edamam.com/search"

get '/' do
  @titlePage = "index"
  erb :index
end
get '/search' do
  @titlePage = "search"
  erb :search
end
post '/search' do
  def h(text)
    Rack::Utils.escape_html(text)
  end
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
  erb :cookie
end
# here to go to the specific page
get '/cookie' do
  @fo ="cookie"
  @titlePage = "cookie"
  @num = 24
  @id = ENV['API_EDAMAM_ID']
  @key = ENV['API_EDAMAM_KEY']

  @arr = []

  req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{@id}&app_key=#{@key}&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)

  i = 0
  while i < @num
    @data = res['hits'][i]["recipe"]
    @cal= res['hits'][i]["recipe"]['calories']
    @ingredientLines = []
    @data["ingredientLines"].each do |y|
      @ingredientLines << y
    end

    @cookie = Cookie.new(i,@data["label"], @data["image"],@ingredientLines, @cal,rand(1.00 .. 4.00) )
    @arr << @cookie
    i += 1
  end
  erb :cookie
end

get '/muffin' do
  @fo ="muffin"
    @titlePage = "muffin"
  @num = 24
  @id = ENV['API_EDAMAM_ID']
  @key = ENV['API_EDAMAM_KEY']

  @arr = []

  req = Curl::Easy.perform(@@path + "?q=#{@fo}&app_id=#{@id}&app_key=#{@key}&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)

  i = 0
  while i < @num
    @data = res['hits'][i]["recipe"]
    @cal= res['hits'][i]["recipe"]['calories']
    @ingredientLines = []
    @data["ingredientLines"].each do |y|
      @ingredientLines << y
    end

    @muffin = Muffin.new(i,@data["label"], @data["image"],@ingredientLines,@cal ,rand(1.00 .. 4.00) )
    @arr << @muffin
    i += 1
  end
  erb :muffin
end

get '/cake' do
  fo ="cake"
  @titlePage = "cake"
  @num = 24
  @id = ENV['API_EDAMAM_ID']
  @key = ENV['API_EDAMAM_KEY']

  @arr = []

  req = Curl::Easy.perform(@@path + "?q=#{fo}&app_id=#{@id}&app_key=#{@key}&from=0&to=#{@num}&calories=591-722&health=alcohol-free")
  res = JSON.parse(req.body)

  i = 0
  while i < @num
    @data = res['hits'][i]["recipe"]
     @cal= res['hits'][i]["recipe"]['calories']
    @ingredientLines = []
    @data["ingredientLines"].each do |y|
      @ingredientLines << y
    end

    @cake = Cake.new(i,@data["label"], @data["image"],@ingredientLines, @cal , rand(1.00 .. 4.00) )
    @arr<< @cake
    i += 1
  end
  erb :cake
end

# #
# account_sid = ENV['ACCOUNT_SID_TWILIO']
#
# auth_token = ENV['AUTH']
#
# @client = Twilio::REST::Client.new(account_sid,auth_token)
#
# fromNum = ENV['THE_NUMBER_PRO'] # Your Twilio number
# toNum= ENV['MY_NUMBER'] # Your mobile phone number
#
# @client.api.account.messages.create(
# from: fromNum,
# to: toNum,
# body: "Hey hhhhhhhhhhhh!"
# )
