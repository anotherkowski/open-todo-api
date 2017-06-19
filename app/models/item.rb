class Item < ApplicationRecord
  belongs_to :list
  # ActiveRecord Validations
  validates :title, :list_id, presence: true
  validates :title, length: { minimum: 3 }, allow_blank: false
end
