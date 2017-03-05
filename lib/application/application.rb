require_relative 'deployment'

class Application

attr_accessor :id, :name, :description, :base_blueprint_id, :base_blueprint_name, :design_differs_from_deployment, :published, :creation_time, :version,
              :next_stop_task, :design, :deployment, :vms

  def initialize(ravello_json)
    obj = [:id, :name, :description, :base_blueprint_id, :base_blueprint_name, :design_differs_from_deployment, :published, :creation_time, :version,:next_stop_task, :design]
    obj.each{|x| instance_variable_set("@#{x.to_s}", ravello_json[x.to_s.camel_case_lower]) unless x.nil?}
    @deployment = Deployment.new(ravello_json['deployment']) unless ravello_json['deployment'].nil?
  end

end
