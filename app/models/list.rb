class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  # ActiveRecord Validations
  validates_associated :items
  validates_associated :user
  validates :title, :user_id, presence: true
  validates :title, length: { minimum: 3 }, allow_blank: false
  validates :title, uniqueness: true

end
