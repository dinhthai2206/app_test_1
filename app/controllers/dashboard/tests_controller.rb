class Dashboard::TestsController < Dashboard::DashboardController
  before_action :find_test

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new test_params
    if @test.save
      flash[:success] = t ".success"
      redirect_to dashboard_test_path @test
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @test.update_attributes test_params
      flash[:success] = t ".success"
      redirect_to dashboard_test_path @test
    else
      flash[:danger] = t ".failed"
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to dashboard_tests_path
  end

  private
  def find_test
    @test = Test.find_by id: params[:id]
  end

  def test_params
    params.require(:test).permit :category_id,
      questions_attributes: [:id, :content, :_destroy,
        options_attributes: [:id, :content, :correct, :_destroy]]
  end
end
