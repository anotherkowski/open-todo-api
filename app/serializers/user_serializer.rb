class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :email, :password
end
