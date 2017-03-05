module Ravello
  module DiskImages
  extend self
    def all
      HTTParty.get(BASE_URI + '/diskImages',
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def show(id)
      HTTParty.get(BASE_URI + "/diskImages/#{id}",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

  end
end
