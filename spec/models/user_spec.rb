require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: 'Sample User', email: 'user@example.com', password: 'password') }
  ## Shoulda tests for name
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { should validate_presence_of(:name) }
  ## Shoulda tests for email
  it { should validate_presence_of(:email)}
  it { is_expected.to validate_length_of(:email).is_at_least(5) }
  it { is_expected.to allow_value('email@example.com').for(:email) }
  # Shoulda tests for password
  it { is_expected.to validate_presence_of(:encrypted_password) }
  it { is_expected.to validate_length_of(:encrypted_password).is_at_least(6) }
  # Shoulda tests for active record associations / nested resources
  it { should have_many(:lists) }

  describe 'attributes' do
     it 'should have name and email attributes' do
       expect(user).to have_attributes(name: 'Sample User', email: 'user@example.com')
     end
   end
   describe 'invalid user' do
     let(:user_with_invalid_name) { User.new(name: '', email: 'user@bloccit.com') }
     let(:user_with_invalid_email) { User.new(name: 'Bloccit User', email: '') }

     it 'should be an invalid user due to blank name' do
       expect(user_with_invalid_name).to_not be_valid
     end
     it 'should be an invalid user due to blank email' do
       expect(user_with_invalid_email).to_not be_valid
     end
   end
end
