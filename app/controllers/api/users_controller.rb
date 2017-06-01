class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    render :json: uesrs, each_serializer: UserSerializer
  end

end
