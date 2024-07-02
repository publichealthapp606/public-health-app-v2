class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :local_resource, null: false, foreign_key: true
      t.boolean :receiving_support
      t.boolean :contacted_local_resources

      t.timestamps
    end
  end
end
