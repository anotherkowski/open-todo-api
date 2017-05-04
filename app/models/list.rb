class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  # Automatically create faux list items upon new user sign-up
  # after_create :create_list_items
  #
  # def create_list_items
  #   items = ['item1', 'item2', 'item3', 'item4']
  #   items.each do |item|
  #     Item.create(title: item, list_id: self.id)
  #   end
  # end
end
