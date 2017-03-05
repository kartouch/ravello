require 'base64'
module Ravello
  module Auth
    extend self

    # Returns a status code 200 when OK
    def base64
      "Basic " + Base64.encode64("#{ENV['RAVELLO_USER']}:#{ENV['RAVELLO_PWD']}")
    end
  end
end
