class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  # ActiveRecord Validations
  validates_associated :items
  validates_associated :user

end
