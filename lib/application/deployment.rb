require_relative 'vm'

class Deployment
  @@attributes = [:total_active_vms, :total_error_vms, :expiration_time, :expiration_type, :publish_start_time, :publish_optimization, :vm_order_groups,
                :stop_vms_by_order, :cloud, :cloud_id, :region_name, :region_id, :vms, :network, :network_filter]

  @@attributes.each{ |attr| attr_accessor attr}

  def initialize(deployment)
    @@attributes.each{|x| instance_variable_set("@#{x.to_s}", deployment[x.to_s.camel_case_lower]) unless deployment[x.to_s.camel_case_lower].nil?}
    @vms = deployment['vms'].map{ |vm| Vm.new(vm) } unless deployment['vms'].nil?
  end
end
