class Question < ApplicationRecord
  belongs_to :survey

  def self.ransackable_attributes(auth_object = nil)
    ["child", "created_at", "id", "language", "option_points_list", "option_selected_to_display_child", "options_list", "parent_question_number", "question_number", "question_text", "survey_id", "updated_at"]
  end

  def options_list= list
    if list.is_a? String
      list = JSON.parse(list)
    end
    super list
  end

  def option_points_list= list
    if list.is_a? String
      list = JSON.parse(list)
    end
    super list
  end
end
