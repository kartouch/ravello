module Ravello
  module Images
  extend self
    def all
      HTTParty.get(BASE_URI + '/images',
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def show(id)
      HTTParty.get(BASE_URI + "/images/#{id}",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

  end
end
