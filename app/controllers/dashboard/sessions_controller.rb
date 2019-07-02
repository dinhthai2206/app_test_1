class Dashboard::SessionsController < ::Devise::SessionsController  
  private
  def after_sign_in_path_for resource
    dashboard_root_url
  end

  def after_sign_out_path_for resource
    dashboard_root_url
  end
end
