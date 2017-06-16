class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :public, :created_at, :user_id

  def title
    object.title
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
