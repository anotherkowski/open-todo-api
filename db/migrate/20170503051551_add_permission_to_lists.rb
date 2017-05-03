class AddPermissionToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :public, :boolean, default: true
  end
end
