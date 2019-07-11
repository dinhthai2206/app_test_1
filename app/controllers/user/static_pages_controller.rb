class User::StaticPagesController < ApplicationController
  layout "user"
  before_action :authenticate_user_member!

  def home
  end
end
