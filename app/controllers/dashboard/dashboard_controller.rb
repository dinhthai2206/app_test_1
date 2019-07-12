class Dashboard::DashboardController < ApplicationController
  layout "dashboard"
  before_action :authenticate_dashboard_admin!

  def home
  end
end
