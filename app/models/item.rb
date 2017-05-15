class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user
  # ActiveRecord Validations
  validates_associated :list
  validates_associated :user
  validates :name, presence: true

end
