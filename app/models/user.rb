class User < ApplicationRecord
  include Clearance::User
  before_validation :downcase_email


  has_many :lists, dependent: :destroy
  # ActiveRecord Validations
  validates_associated :lists
  validates :name, :email, :encrypted_password, presence: true
  validates :name, :email, uniqueness: true
  validates :name, length: { minimum: 3 }
  validates :email, length: { minimum: 5 }
  validates :encrypted_password, length: { minimum: 6 }

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
