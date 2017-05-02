class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: @user.email + " successfully updated!"
    else
      render "edit"
    end
  end

    private

    def user_params
      params.require(:user).permit(:email, :roles)
    end
end
