require 'rails_helper'

RSpec.describe List, type: :model do
  let(:user) { User.create!(name: 'Sample User', email: 'user@example.com', password: 'password') }
  let(:list) { List.create!(title: 'Sample list', user_id: user) }

  ## Shoulda tests for title
  it { should validate_uniqueness_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { should validate_presence_of(:title) }
  ## Shoulda tests for user id
  it { should validate_presence_of(:user_id)}
  # Shoulda tests for active record associations / nested resources
  it { should have_many(:items) }
  it { should belong_to(:user) }

  describe 'attributes' do
     it 'should have title attribute' do
       expect(list).to have_attributes(title: 'Sample list', user_id: user.id)
     end
   end
   describe 'invalid list' do
     let(:list_with_invalid_title) { List.new(title: '', user_id: user.id) }
     let(:list_with_invalid_user) { List.new(title: 'Sample list', user_id: '') }

     it 'should be an invalid list due to blank title' do
       expect(list_with_invalid_title).to_not be_valid
     end
     it 'should be an invalid list due to blank user' do
       expect(list_with_invalid_user).to_not be_valid
     end
   end
end
