class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    render :json: users, each_serializer: UserSerializer
  end
  
  def create
  end

   private
   def user_params
     params.require(:user).permit(:username, :password)
   end
end
