class User::UserAnswersController < User::StaticPagesController
  def create
    question = Option.find(params[:user_answer][:option_id]).question
    user_answer = UserTest.find(params[:user_test_id]).user_answers
      .find_or_initialize_by(question_id: question.id)
    user_answer.update!(user_answer_params)

    respond_to do |format|
      format.json { head :ok }
    end
  end

  private
  def user_answer_params
    params.require(:user_answer).permit(:option_id)
  end
end
