module Ravello
  module Blueprints
  extend self
    def all
      HTTParty.get(BASE_URI + '/blueprints',
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def show(id)
      HTTParty.get(BASE_URI + "/blueprints/#{id}",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def create(id,name,offline,desc="")
        HTTParty.post(BASE_URI + '/blueprints',
        headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"},
        body: {applicationId: id, blueprintName: name, offline: offline, description: desc}.to_json)
    end
  end
end
