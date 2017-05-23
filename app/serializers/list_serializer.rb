class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :public, :created_at
  has_many :items

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
  
end
