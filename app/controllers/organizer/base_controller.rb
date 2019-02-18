class Organizer::BaseController < ApplicationController
  layout "organizer_layout"
  before_action :require_organizer

  private

  def require_organizer
    redirect_to root_path unless current_user.role_name == Settings.role_organizer
  end
end
