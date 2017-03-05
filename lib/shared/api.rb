require 'httparty'
require_relative '../ravello/auth'

class Api
  BASE_URI = 'https://cloud.ravellosystems.com/api/v1/'

  def self.get(endpoint)
    HTTParty.get(BASE_URI + endpoint,
    headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
  end

  def self.post(endpoint,body=nil)
    HTTParty.post(BASE_URI + endpoint,
    headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"},
    body: body)
  end

end
