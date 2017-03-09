require_relative 'ravello/auth'
require_relative 'ravello/common'
require_relative 'ravello/applications'
require_relative 'ravello/blueprints'
require_relative 'ravello/auth'
require_relative 'application/application'
require_relative 'shared/api'
require_relative 'shared/string'

require 'httparty'

module Ravello
  include Auth
  include Common
  include Applications
  include Blueprints

=begin
  Ravello::Applications.get_endpoints.each do |meth,ep|s
     define_method(meth.to_sym) do |*args|
       Application.new(Api.get(formated_ep(ep,args)))
     end
  end


=end

end
