class User::TestsController < User::StaticPagesController
  def index
    @category = Category.all
    if params[:category_id].present?
      @tests = Test.where(category_id: params[:category_id]).publish
    else
      @tests = Test.publish
    end
  end

  def join
    @test = Test.find_by id: params[:id]
    @user_test = @test.user_tests.find_or_create_by(user_id: current_user_member.id)
    @user_test.update_column(:expired_at, @user_test.created_at + 30*60)
    CompleteTestWorker.perform_at(30.minutes.from_now, @user_test.id)
    redirect_to edit_user_user_test_path @user_test
  end
end
