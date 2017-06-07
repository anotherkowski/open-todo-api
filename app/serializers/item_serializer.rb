class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :user_id, :created_at

  def title
    object.title
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end
