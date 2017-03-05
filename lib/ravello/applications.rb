require_relative '../application'
module Ravello
  module Applications
  extend self
    def all
      HTTParty.get(BASE_URI + '/applications',
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def show(id,opt=nil)
      if opt.nil?
        resp = HTTParty.get(BASE_URI + "/applications/#{id}",headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
        @application = Application.new(resp)
      else
        resp = HTTParty.get(BASE_URI + "/applications/#{id};#{opt}",headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
        @application = Application.new(resp
      end
    end

    def action(id,action)
      HTTParty.post(BASE_URI + "/applications/#{id}/#{action}",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def vms(id)
      HTTParty.get(BASE_URI + "/applications/#{id}/vms",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def public_ip(id,vm)
      HTTParty.get(BASE_URI + "/applications/#{id}/vms/#{vm}/publicIps;deployment",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"})
    end

    def set_expiration_time(id,time)
      HTTParty.post(BASE_URI + "/applications/#{id}/setExpiration",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"},
      body: time.to_json)
    end

    def create(body)
        HTTParty.post(BASE_URI + '/applications',
        headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"},
        body: body)
    end

    def update(id,body)
        HTTParty.put(BASE_URI + "/applications/#{id}",
        headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"},
        body: body)
    end

    def publish(id,preferences)
      HTTParty.post(BASE_URI + "/applications/#{id}/publish",
      headers: {"Authorization" => Ravello::Auth.base64 ,"Accept" => "application/json", "Content-Type" =>"application/json"},
      body: preferences)
    end

    def vnc_url(id,vm)
       url = URI(BASE_URI + "/applications/#{id}/vms/#{vm}/vncUrl")
       cmd = system("curl --user #{ENV['RAVELLO_USER']}:#{ENV['RAVELLO_PWD']} #{url}")
       return cmd
    end

  end
end
