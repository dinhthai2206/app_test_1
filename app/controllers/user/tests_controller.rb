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
    @user_test = @test.user_tests.create(user_id: current_user_member.id)
    redirect_to edit_user_user_test_path @user_test
  end
end
