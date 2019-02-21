class UsersController < ApplicationController
  include UsersHelper
  before_action :load_user, only: %i(update show)

  def update
    if @user.update(user_params)
      flash[:notice] = t "success"
    else
      flash[:danger] = t "error"
    end
      redirect_to admin_users_path
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "error"
    redirect_to new_user_session_path
  end

  def user_params
    params.require(:user).permit(:role_id, :email, :password)
  end
end
