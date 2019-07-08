class User::UserTestsController < User::StaticPagesController
  before_action :find_user_test

  def index
    @user_tests = current_user_member.user_tests.highest_score
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def find_user_test
    @user_test = UserTest.find_by id: params[:id]
  end
end
