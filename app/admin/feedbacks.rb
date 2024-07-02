ActiveAdmin.register Feedback do
  
  permit_params  :receiving_support, :user_id, :contacted_local_resources, :local_resource_id, :created_at, :updated_at

  index do
    selectable_column
    id_column
    column :user_id do |resource|
    	value = User.find_by(id: resource.user_id)
    	if value.first_name && value.last_name.present?
    		value.first_name+ ' ' +value.last_name
    	end
    end
    column :local_resource_id do |resource_val|
    	value = LocalResource.find_by(id: resource_val.local_resource_id)
    	if value.name.present?
    		value.name
    	end
    end
    column :receiving_support
    column :contacted_local_resources
    actions defaults: true
  end

end
