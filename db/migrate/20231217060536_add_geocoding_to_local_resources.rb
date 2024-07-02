class AddGeocodingToLocalResources < ActiveRecord::Migration[7.0]
  def change
    add_column :local_resources, :latitude, :float
    add_column :local_resources, :longitude, :float
  end
end
