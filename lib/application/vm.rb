require_relative 'hard_drives'

class Vm
  @@attributes = [:name, :description, :creation_time, :memory_size, :num_cpus, :platform, :os,
                :supports_cloud_init, :user_data, :requires_key_pair, :key_pair_id, :hostnames, :application_id,
                :legacy_mode , :loading_status, :loading_percentage, :base_vm_id, :bios_uuid, :cpu_ids, :boot_order,
                :rtc, :display_device, :vm_order_group_id, :stop_time_out, :hard_drives]

  @@attributes.each { |attr| attr_accessor attr}

  def initialize(vm)
    @@attributes.each{|x| instance_variable_set("@#{x.to_s}", vm[x.to_s.camel_case_lower]) unless x.nil?}
    @hard_drives = vm['hardDrives'].map{|hd| HardDrives.new(hd)}
  end
end
