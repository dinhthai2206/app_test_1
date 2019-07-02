class Dashboard::CategoriesController < Dashboard::DashboardController
  before_action :find_category

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to dashboard_categories_path
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
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to dashboard_categories_path
    else
      flash[:danger] = t ".failed"
      render :edit
    end
  end

  def destroy
    @category.destroy
  end

  private
  def find_category
    @category = Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit :title
  end
end
