class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :user_id, :created_at
end
