require_relative 'deployment'
require_relative '../ravello'
require_relative '../shared/string'

class Application

@@attributes = [:id, :name, :description, :base_blueprint_id, :blueprint_name, :design_differs_from_deployment, :published, :creation_time, :version,
              :next_stop_task, :design, :deployment]

@@attributes.each {|attr| attr_accessor attr}

  def initialize(ravello_json)
    @@attributes.each{|x| instance_variable_set("@#{x.to_s}", ravello_json[x.to_s.camel_case_lower]) unless x.nil?}
    @deployment = Deployment.new(ravello_json['deployment']) unless ravello_json['deployment'].nil?
  end

end
