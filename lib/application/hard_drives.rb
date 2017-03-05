require 'ostruct'
class HardDrives
  attr_accessor :id, :name, :boot, :size, :index, :type, :controller,
                :base_disk_image_id, :base_disk_image_name, :controller_index, :controller_pci_slot, :loading_status, :loading_percentage

  def initialize(vm_hard_drives)

    obj = [:id, :name, :boot, :index, :type, :controller,:base_disk_image_id, :base_disk_image_name, :controller_index, :controller_pci_slot, :loading_status, :loading_percentage]
    vm_hard_drives.each do
      obj.each{|x| instance_variable_set("@#{x.to_s}", vm_hard_drives[x.to_s.camel_case_lower]) unless x.nil?}
      @size = OpenStruct.new(vm_hard_drives['size']) unless vm_hard_drives['size'].nil?
    end


  end

end
