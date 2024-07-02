class AddPartnerToLocalResource < ActiveRecord::Migration[7.0]
  def change
    add_column :local_resources, :is_partner, :boolean
  end
end
