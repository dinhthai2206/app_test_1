class User::StaticPagesController < ApplicationController
  before_action :authenticate_user_member!

  def home
  end
end
