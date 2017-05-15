class Item < ApplicationRecord
  belongs_to :list
  #belongs_to :user
  # ActiveRecord Validations
  validates :title, :list_id, presence: true
  validates :title, length: { minimum: 3 }, allow_blank: false
  validates :title, uniqueness: { case_sensitive: true }
end
