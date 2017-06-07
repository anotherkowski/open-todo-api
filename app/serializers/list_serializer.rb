class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :public, :created_at
end
