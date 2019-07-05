class Dashboard::DashboardController < ApplicationController
  layout "dashboard"
  before_action :require_login

  def home
  end

  private
  def require_login
    unless current_dashboard_admin
      redirect_to new_dashboard_admin_session_url
    end
  end
end
