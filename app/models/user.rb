class User < ApplicationRecord
  include Clearance::User

  has_many :lists, dependent: :destroy
  # ActiveRecord Validations
  validates_associated :lists
end
