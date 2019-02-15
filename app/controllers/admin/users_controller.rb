class Admin::UsersController < Admin::BaseController
  include UsersHelper
  before_action :load_user, only: :destroy
  def index
    @q = User.not_current_user(current_user.id).search(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(Settings.page_permit)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = t "success"
    else
      flash[:danger] = t "error"
    end
      redirect_to admin_users_path
  end

  def destroy
    if @user.destroy
      respond_to do |format|
        format.html {redirect_to admin_users_path, notice: t("success")}
        format.json {head :no_content}
        format.js {render layout: false}
      end
    end
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "error"
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit(:role_id, :email, :password)
  end
end
