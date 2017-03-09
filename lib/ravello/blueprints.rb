module Ravello::Blueprints
  module_function
  def get_endpoints
    {
      all: self.to_s.module_name,
      private: "organizations/:id/#{self.to_s.module_name}",
      show: "#{self.to_s.module_name}/:id",
    }.merge!(Ravello::Common.get_endpoints(self.to_s.module_name))
  end

  def post_endpoints
    {}.merge!(Ravello::Common.post_endpoints(self.to_s.module_name))
  end

  def put_endpoints
    {}.merge!(Ravello::Common.put_endpoints(self.to_s.module_name))
  end

  def delete_endpoints
    {}.merge!(Ravello::Common.delete_endpoints(self.to_s.module_name))
  end


end
