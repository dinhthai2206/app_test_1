class User::UserTestsController < User::StaticPagesController
  before_action :find_user_test

  def index
    @user_tests = current_user_member.user_tests.highest_score
  end

  def show
    @questions = @user_test.test.questions
  end

  def edit
    if @user_test.completed?
      redirect_to user_user_test_path(@user_test)
    else
      @questions = @user_test.test.questions
    end
  end

  def update
    @user_test.completed!
    redirect_to user_user_test_path(@user_test)
  end

  private
  def find_user_test
    @user_test = UserTest.find_by id: params[:id]
  end
end
