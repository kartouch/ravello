require_relative '../ravello'
require_relative 'common'
require_relative '../shared/string'
require_relative '../shared/api'

module Ravello::Applications
  module_function
    def formated_ep(ep,args)
      str = ep
      args.each do |arg|
        arg.each do |k,v|
          str =  str.gsub(":#{k}",v.to_s)
        end
      end
      str = str.gsub(/;:\w{1,8}/,'')
      return str
    end

    def get_endpoints
     {
      show: "#{self.to_s.module_name}/:id;:view",
      vms: "#{self.to_s.module_name}/:id;:view/vms",
      vm: "#{self.to_s.module_name}/:id;:view/vms/:vmId",
      vnc_url: "#{self.to_s.module_name}/:id/vms/:vmId/vncUrl",
      fqdn: "#{self.to_s.module_name}/:id/vms/:vmId/fqdn;deployment",
      cloud_state: "#{self.to_s.module_name}/:id/vms/:vmId/state;deployment",
      public_ips: "#{self.to_s.module_name}/:id/vms/:vmId/publicIps;deployment",
      published?: "#{self.to_s.module_name}/:id/isPublished",
    }.merge!(Ravello::Common.get_endpoints(self.to_s.module_name))
    end

    def post_endpoints
    {
      publish: "#{self.to_s.module_name}/:id/publish",
      action: "#{self.to_s.module_name}/:id/:action",
      single_vm_action: "#{self.to_s.module_name}/:id/vms/:vmId/:action",
      multiple_vms_action: "#{self.to_s.module_name}/:id/vms/:action",
      set_expiration: "#{self.to_s.module_name}/:id/setExpiration",
      calc_price: "#{self.to_s.module_name}/:id;:view/calcPrice",
      add_vm: "#{self.to_s.module_name}/:id/vms",
    }.merge!(Ravello::Common.post_endpoints(self.to_s.module_name))
    end

    def put_endpoints
      { update: "#{self.to_s.module_name}/:id",
        update_vm: "#{self.to_s.module_name}/:id/vms/:vmId",
      }.merge!(Ravello::Common.put_endpoints(self.to_s.module_name))
    end

    def delete_endpoints
      {}.merge!(Ravello::Common.delete_endpoints(self.to_s.module_name))
    end

    def all
      Api.get(self.to_s.module_name).map{ |app| Application.new(app) }
    end

    get_endpoints.each do |meth,ep|
       define_method(meth.to_sym) do |*args|
         Application.new(Api.get(formated_ep(ep,args)))
       end
    end

    post_endpoints.each do |meth,ep|
      define_method(meth.to_sym) do |*args|
        Api.post(formated_ep(ep,args),args.first[:body])
      end
    end

end
