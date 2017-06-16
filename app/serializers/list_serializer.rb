class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :public, :created_at

  def title
    object.title
  end

  def public
    object.public
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
