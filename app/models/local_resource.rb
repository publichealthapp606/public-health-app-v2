# class LocalResource < ApplicationRecord
#   validates :zip,:name,:website,:address, presence: true
#   geocoded_by :address
#   geocoded_by :zip
#   after_validation :geocode 

#   has_many :feedbacks, dependent: :destroy

#   def self.ransackable_associations(auth_object = nil)
#     [:feedbacks]
#   end

#   def self.ransackable_attributes(auth_object = nil)
#     ["address", "created_at", "email", "id", "name", "phone_number", "updated_at", "website", "zip", "latitude", "longitude", "is_partner"]
#   end

#   # after_validation :geocode, if: :address_changed?
# end

class LocalResource < ApplicationRecord
  validates :zip, :name, :website, :address, presence: true
  geocoded_by :address
  geocoded_by :zip
  after_validation :geocode 

  has_many :feedbacks, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ['feedbacks']
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "email", "id", "name", "phone_number", "updated_at", "website", "zip", "latitude", "longitude", "is_partner"]
  end
end
