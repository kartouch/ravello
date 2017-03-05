require_relative 'vm'

class Deployment
  attr_accessor :total_active_vms, :total_error_vms, :expiration_time, :expiration_type, :publish_start_time, :publish_optimization, :vm_order_groups,
                :stop_vms_by_order, :cloud, :cloud_id, :region_name, :region_id, :vms, :network, :network_filter

  def initialize(deployment)
    obj = [:total_active_vms, :total_error_vms, :expiration_time, :expiration_type, :publish_start_time, :publish_optimization, :vm_order_groups,
                  :stop_vms_by_order, :cloud, :cloud_id, :region_name, :region_id]
    obj.each{|x| instance_variable_set("@#{x.to_s}", deployment[x.to_s.camel_case_lower]) unless x.nil?}
    @vms = deployment['vms'].map{|vm| Vm.new(vm) }
  end
end
