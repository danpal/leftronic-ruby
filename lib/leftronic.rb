$:.unshift File.expand_path("..", __FILE__)


require 'net/http'
require 'net/https'
require 'rubygems'
require 'json'

class Leftronic
  ALLOWED_COLORS = [:red, :yellow, :green, :blue, :purple]
  attr_accessor :key
  def url=(url)
    @url = URI(url.to_s)
  end
  def url
    @url.to_s
  end

  def initialize(key, url='https://www.leftronic.com/customSend/')
    @key = key
    @lists = {} 
    self.url = url
  end

  # Push anything to a widget
  def push(stream, object)
    post stream, object
  end

  # Push a Number to a widget
  def push_number(stream, point)
    post stream, point
  end

  # Push a geographic location (latitude and longitude) to a Map widget
  def push_geo(stream, lat, long, color=nil)
    post stream, 'latitude' => lat, 'longitude' => long, 'color' => color
  end

  # Push a title and message to a Text Feed widget
  def push_text(stream, title, message)
    post stream, 'title' => title, 'msg' => message
  end

  # Push a hash to a Leaderboard widget
  def push_leaderboard(stream, hash)
    leaderboard = hash.inject([]) do |array, (key, value)|
      array << {'name' => key, 'value' => value}
    end
    post stream, 'leaderboard' => leaderboard
  end

  # Push an array to a List widget
  def push_list(stream, msg)
    if(@lists[stream])
      @lists[stream].push(msg)
      post stream, 'list' => @lists[stream].array.flatten.map{|item| {'listItem' => item}}
    end
  end

  # This pushes the new tableRow. Notice :tableRow is a new key to specify to leftronic
  # this is only 1 row so not all table is updated
  def push_table(stream, row)
    post stream, {:tableRow => row}
  end

  #This creates the initial table sending the title  
  def create_table(stream, title)
    post stream, title
  end
 
  def create_list(stream)
    @lists[stream] = Leftronic::List.new()
  end 

  protected

  def post(stream, params)
    Thread.new do
      request = build_request(stream, params)
      connection = build_connection
      connection.start{|http| http.request request}
      params 
    end
  end

  def build_request(stream, params)
    request = Net::HTTP::Post.new @url.request_uri
    request['Accept'] = 'application/json'
    request['Content-Type'] = 'application/json'
    request.body = {
      'accessKey' => @key,
      'streamName' => stream,
      'point' => params
    }.to_json
    request
  end

  def build_connection # NOTE: Does not open the connection
    connection = Net::HTTP.new @url.host, @url.port
    if @url.scheme == 'https'
      connection.use_ssl = true
      connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    connection
  end
end

