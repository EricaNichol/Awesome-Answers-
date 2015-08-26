class FeedbacksController < ApplicationController

  def create
    @feedback = Feedback.new feedback_params
    @answer = Answer.find params[:answer_id]
    @feedback.answer = @answer
    @feedback.save
    redirect_to question_path(@answer.question), notice: "good job!"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
