module Ravello::Common
  module_function
  def get_endpoints(endpoint)
    {
      publish_locations: "#{endpoint}/:id/publishLocations",
      get_documentation: "#{endpoint}/:id/documentation"
    }
  end

  def post_endpoints(endpoint)
    {
      create: endpoint,
      create_documentation: "#{endpoint}/:id/documentation"
    }
  end

  def put_endpoints(endpoint)
    {
      update_documentation: "#{endpoint}/:id/documentation"
    }
  end

  def delete_endpoints(endpoint)
    {
      delete: "#{endpoint}/:id",
      delete_documentation: "#{endpoint}/:id/documentation",
    }
  end

end
