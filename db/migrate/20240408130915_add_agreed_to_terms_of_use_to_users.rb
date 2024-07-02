class AddAgreedToTermsOfUseToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :agreed_to_terms_of_use, :boolean
  end

  def down
    remove_column :users, :agreed_to_terms_of_use
  end
end
