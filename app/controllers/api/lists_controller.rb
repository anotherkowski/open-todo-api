class Api::ListsController < ApiController
  before_action :authenticated?
  before_action :set_user

  def create
    @list = @user.lists.build(list_params)
    if @list.save
      render json: @list
    else
      render json: { errors: @list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  def list_params
    params.require(:list).permit(
    :title, :public)
  end
end
