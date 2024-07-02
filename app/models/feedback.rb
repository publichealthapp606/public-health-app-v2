class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :local_resource
end
