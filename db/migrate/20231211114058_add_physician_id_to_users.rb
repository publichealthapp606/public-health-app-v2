class AddPhysicianIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :physician_id, :integer
  end
end
