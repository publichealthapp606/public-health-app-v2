class Survey < ApplicationRecord
  has_many :questions
  has_many :responses

  def self.ransackable_associations(auth_object = nil)
    ["questions" , "responses"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "languages", "survey_category", "survey_name", "updated_at"]
  end
  accepts_nested_attributes_for :questions
end
