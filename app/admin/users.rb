ActiveAdmin.register User, as: 'Patient' do
  belongs_to :admin_user, optional: true
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :address_line_1, :address_line_2, :city, :state, :zip, :phone_number, :date_of_birth, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :gender, :role, :physician_id
  #
  # or
  #
  permit_params do
    permitted = [:email, :first_name, :last_name, :address_line_1, :address_line_2, :city, :state, :zip, :phone_number, :date_of_birth, :gender, :physician_id, :sign_in_count]
  end

  form(title: 'Patient') do |f|
    f.inputs do
      input :first_name, :input_html => { :rows => 1 }
      input :last_name, :input_html => { :rows => 1 }
      input :email, :input_html => { :rows => 1 }
      input :phone_number, :input_html => { :rows => 1 }
      input :address_line_1, :input_html => { :rows => 2 }
      input :address_line_2, :input_html => { :rows => 2 }
      input :zip, :input_html => { :rows => 1 }
      input :city, :input_html => { :rows => 1 }
      input :state, :input_html => { :rows => 1 }
      input :zip, :input_html => { :rows => 1 }
      input :date_of_birth, :input_html => { :rows => 1 }
      input :gender, :input_html => { :rows => 1 }
      input :physician_id, as: :select, collection: AdminUser.physician.map{|p| ["#{p.first_name} #{p.last_name}", p.id]}, include_blank: "Select Physician"
    end
    # panel 'Markup' do
    #   "The following can be used in the content below..."
    # end
    # inputs 'Content', :body
    # para "Press cancel to return to the list without saving."
    f.actions
  end

  controller do
    def scoped_collection
      if current_admin_user.physician?
        User.where(physician_id: current_admin_user.id)
      else
        User.all
      end
    end
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :phone_number
    column :sign_in_count
    column :average_session do |resource|
      if resource.last_sign_in_at.present? && resource.current_sign_in_at.present?
        time_difference_in_seconds = (resource.current_sign_in_at).to_i - (resource.last_sign_in_at).to_i
        utc_datetime = "#{(time_difference_in_seconds / 60).to_i} minutes"
      else
        'N/A' # or any default value you prefer
      end
    end
    column :physician_id
    actions defaults: true
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :phone_number
end
