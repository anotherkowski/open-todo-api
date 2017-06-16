class User < ApplicationRecord
  include Clearance::User
  before_validation :downcase_email


  has_many :lists, dependent: :destroy
  # ActiveRecord Validations
  validates_associated :lists
  validates :name, :email, :encrypted_password, presence: true
  validates :name, :email, uniqueness: { case_sensitive: false }
  validates :name, length: { minimum: 3 }
  validates :email, length: { minimum: 5 }
  validates :encrypted_password, length: { minimum: 6 }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
