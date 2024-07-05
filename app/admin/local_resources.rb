ActiveAdmin.register LocalResource do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :zip, :name, :website, :address, :phone_number, :email, :is_partner
  #
  # or
  #
  # permit_params do
  #   permitted = [:zip, :name, :website, :address, :phone_number, :email]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :zip
    column :email
    column :phone_number
    column :is_partner
    actions defaults: true
  end

  # form(title: 'Local Resource') do |f|
  #   f.inputs do
  #     debugger
  #     input :name, :input_html => { :rows => 1 }
  #     input :email, :input_html => { :rows => 1 }
  #     input :phone_number, :input_html => { :rows => 1 }
  #     input :website, :input_html => { :rows => 1 }
  #     input :address, :input_html => { :rows => 2 }
  #     input :zip
  #   end
  #   # panel 'Markup' do
  #   #   "The following can be used in the content below..."
  #   # end
  #   # inputs 'Content', :body
  #   # para "Press cancel to return to the list without saving."
  #   f.actions
  # end

  form(title: 'Local Resource') do |f|
    f.inputs do
      input :name
      input :email
      input :phone_number
      input :website
      input :address
      input :zip
      input :is_partner
    end
    f.actions
  end


end
