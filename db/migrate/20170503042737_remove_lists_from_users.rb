class RemoveListsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :list_id
    remove_column :users, :item_id
  end
end
