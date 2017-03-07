require 'json'

describe  Application do

  attributes = [:id, :name, :description, :base_blueprint_id, :blueprint_name, :design_differs_from_deployment, :published, :creation_time, :version,
                :next_stop_task, :design]

  attributes.each do |attr|

    it "has a #{attr}" do
      expect(application.send(attr)).to eq json_response[attr.to_s.camel_case_lower]
      expect(application.send(attr)).to_not eq nil
    end
    
  end

  it "has a deployment" do
    expect(application.deployment.class).to eq Deployment
    expect(application.deployment.is_a?(Object)).to eq true
  end

end

describe Deployment do

  attributes = [:total_active_vms, :total_error_vms, :expiration_time, :expiration_type, :publish_start_time, :publish_optimization, :vm_order_groups,
                :stop_vms_by_order, :cloud, :cloud_id, :region_name, :region_id]

  attributes.each do |attr|

    it "has a #{attr}" do
      expect(application.deployment.send(attr)).to eq json_response[application.deployment.class.to_s.downcase][attr.to_s.camel_case_lower]
    end

  end

  it "has a cloud_region" do

  end


end
