class User < ApplicationRecord
  include Clearance::User

  has_many :lists, dependent: :destroy
  has_many :items, dependent: :destroy
end
