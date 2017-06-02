class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    render :json: users, each_serializer: UserSerializer
  end
  
  def destroy
     begin
       user = User.find(params[:id])
       user.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end
end
