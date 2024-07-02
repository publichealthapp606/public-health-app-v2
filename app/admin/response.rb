ActiveAdmin.register Response do
  
  permit_params  :survey_id, :user_id, :question_number, :response_score, :response_option_number, :response_option_number, :time_submitted, :created_at, :updated_at

  index do
    selectable_column
    id_column
    column :patient do |resource|
      user = User.find_by(id: resource.user_id)
      full_name = user.first_name + ' ' + user.last_name
    end
    column :survey_id do |resource|
      Survey.find_by(id: resource.survey_id).survey_name
    end
    # column :question_number
    column :question do |question_responses|
    Question.where(question_number: question_responses.question_number,survey_id: question_responses.survey_id).last.question_text
    end
    column :answer do |question_response|
      question_response.response_option_number.nil? ? "" : Question.where(question_number: question_response.question_number,survey_id: question_response.survey_id).first.options_list[question_response.response_option_number]
    end
    # column :response_score
    # column :response_option_number
    # column :response_option_number
    column :time_submitted
    actions defaults: true
  end

end
