require 'rubygems'
require 'curb'
require 'json'

class Leftronic

  attr_accessor :accessKey
  
  # Class variable
  def initialize(accessKey)
      @@accessKey = accessKey
  end

  def self.pushNumber(streamName, point)
      ### Pushing a number to a Number, Horizontal/Vertical Bar, or Dial widget
      parameters = {"accessKey" => @@accessKey, "streamName" => streamName, "point" => point}
      # Convert to JSON
      jsonData = parameters.to_json()
      # Form request
      urlRequest = Curl::Easy.http_post("https://beta.leftronic.com/customSend/", jsonData
      # Make request
          ) do |curl|
            curl.headers['Accept'] = 'application/json'
            curl.headers['Content-Type'] = 'application/json'
          end
  end

  def self.pushGeo(streamName, lati, longi)
      ### Pushing a geographic location (latitude and longitude) to a Map widget
      parameters = {"accessKey" => @@accessKey, "streamName" => streamName, "point" => {
        "latitude" => lati, "longitude" => longi}}
      # Convert to JSON
      jsonData = parameters.to_json()
      # Form request
      urlRequest = Curl::Easy.http_post("https://beta.leftronic.com/customSend/", jsonData
      # Make request
          ) do |curl|
            curl.headers['Accept'] = 'application/json'
            curl.headers['Content-Type'] = 'application/json'
          end
  end
  
  def self.pushText(streamName, myTitle, myMsg)
      ### Pushing a title and message to a Text Feed widget
      parameters = {"accessKey" => @@accessKey, "streamName" => streamName, "point" => {
        "title" => myTitle, "msg" => myMsg}}
      # Convert to JSON
      jsonData = parameters.to_json()
      # Form request
      urlRequest = Curl::Easy.http_post("https://beta.leftronic.com/customSend/", jsonData
      # Make request
          ) do |curl|
            curl.headers['Accept'] = 'application/json'
            curl.headers['Content-Type'] = 'application/json'
          end
  end

  def self.pushLeaderboard(streamName, leaderArray)
      ### Pushing an array to the Leaderboard widget
      parameters = {"accessKey" => @@accessKey, "streamName" => streamName, "point" => {
        "leaderboard" => leaderArray}}
      # Convert to JSON
      jsonData = parameters.to_json()
      # Form request
      urlRequest = Curl::Easy.http_post("https://beta.leftronic.com/customSend/", jsonData
      # Make request
          ) do |curl|
            curl.headers['Accept'] = 'application/json'
            curl.headers['Content-Type'] = 'application/json'
          end
  end
  
  def self.pushList(streamName, listArray)
      ### Pushing an array to the List widget
      parameters = {"accessKey" => @@accessKey, "streamName" => streamName, "point" => {
        "list" => listArray}}
      # Convert to JSON
      jsonData = parameters.to_json()
      # Form request
      urlRequest = Curl::Easy.http_post("https://beta.leftronic.com/customSend/", jsonData
      # Make CURL request
          ) do |curl|
            curl.headers['Accept'] = 'application/json'
            curl.headers['Content-Type'] = 'application/json'
          end
  end

end
