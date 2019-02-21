class Admin::BaseController < ApplicationController
  layout "admin_layout"
  before_action :require_admin

  private

  def require_admin
    unless current_user.role_name == Settings.role_admin
      redirect_to root_path
      flash[:notice] = t "admin_only"
    end
  end
end
