json.extract! local_resource, :id, :name, :zip, :website, :address, :phone_number, :email, :created_at, :updated_at
json.url local_resource_url(local_resource, format: :json)
