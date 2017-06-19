require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create!(name: 'Sample User', email: 'user@example.com', password: 'password') }
  let(:list) { List.create!(title: 'Sample list', user_id: user.id) }
  let(:item) {Item.create!(title: 'Sample item', list_id: list.id)}

  ## Shoulda tests for title
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { should validate_presence_of(:title) }
  ## Shoulda tests for list id
  it { should validate_presence_of(:list_id)}
  # Shoulda tests for active record associations / nested resources
  it { should belong_to(:list) }

  describe 'attributes' do
     it 'should have title attribute' do
       expect(item).to have_attributes(title: 'Sample item', list_id: list.id)
     end
   end
   describe 'invalid item' do
     let(:item_with_invalid_title) { Item.new(title: '', list_id: list.id) }
     let(:item_with_invalid_list) { Item.new(title: 'Sample item', list_id: '') }

     it 'should be an invalid item due to blank title' do
       expect(item_with_invalid_title).to_not be_valid
     end
     it 'should be an invalid list due to blank user' do
       expect(item_with_invalid_list).to_not be_valid
     end
   end
end
