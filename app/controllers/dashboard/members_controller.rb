class Dashboard::MembersController < Dashboard::DashboardController
  def index
    @q = Member.ransack(params[:q])
    @members = @q.result.count_tests
  end

  def show
    @member = Member.find_by id: params[:id]
    @user_tests = @member.user_tests
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params).tap do |member|
      member.password = member.password_confirmation = Devise.friendly_token.first(8)
    end
    if @member.save
      flash[:success] = t ".success"
      MemberMailer.welcome(@member, @member.password).deliver_now
      redirect_to dashboard_members_path
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  def destroy
    @member = Member.find_by id: params[:id]
    @member.destroy
    redirect_to dashboard_members_path
  end

  private
  def member_params
    params.require(:member).permit :name, :email, :gender
  end
end
