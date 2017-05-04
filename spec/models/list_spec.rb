require 'rails_helper'

RSpec.describe List, type: :model do
  ## Shoulda tests for title
  it { should validate_uniqueness_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(3) }
  it { should validate_presence_of(:title) }
  ## Shoulda tests for user id
  it { should validate_presence_of(:user_id)}
  # Shoulda tests for active record associations / nested resources
  it { should have_many(:items) }
  it { should belong_to(:user) }
end
