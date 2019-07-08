class User::RegistrationsController < Devise::RegistrationsController

  protected
  def after_update_path_for resource
    user_profile_path
  end

  def account_update_params
    params.require(:user_member).permit :name, :email, :password,
      :password_confirmation, :current_password, :gender
  end
end
