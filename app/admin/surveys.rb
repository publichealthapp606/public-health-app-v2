ActiveAdmin.register Survey do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :survey_name, :survey_category, :languages,
                  questions_attributes: [:id, :language, :question_text, :options_list, :option_points_list, :question_number, :child, :option_selected_to_display_child, :parent_question_number, :_destroy]

  # controller do
  #   def update
  #     byebug
  #     # permitted_params[:my_model][:synonyms] = JSON.parse permitted_params[:my_model][:synonyms]
  #     super
  #   end
  # end

  form(title: 'Survey') do |f|
    # f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      input :survey_name, :input_html => { :rows => 1 }
      input :survey_category, :input_html => { :rows => 1 }
    end
    f.inputs 'Questions' do
      f.has_many :questions, heading: false, allow_destroy: true do |a|
        a.input :language, as: :select, collection: ['English']
        a.input :question_text, :input_html => { :rows => 3 }
        a.input :options_list, :as => :text, :input_html => { :rows => 1 }
        a.input :option_points_list, :as => :text, :input_html => { :rows => 1 }
        a.input :question_number, :input_html => { :rows => 1 }
        a.input :child, :input_html => { :rows => 1 }
        a.input :option_selected_to_display_child, :input_html => { :rows => 1 }
        a.input :parent_question_number
      end
    end
    # panel 'Markup' do
    #   "The following can be used in the content below..."
    # end
    # inputs 'Content', :body
    # para "Press cancel to return to the list without saving."
    f.actions
  end

end
