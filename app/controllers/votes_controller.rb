class VotesController < ApplicationController
  before_action :authenticate_user!, :find_question

  def create
    vote = Vote.new(vote_params)
    vote.user = current_user
    vote.question = @question
  if vote.save
    redirect_to question_path(@question), notice: "Voted!"
  else
    redirect_to question_path(@question), alert: "Can't Vote"
  end
end



  def updated
  end

  def destroy
    vote = Vote.find params[:id]
    if can? :destroy, vote
      vote.destroy
      redirect_to @question, notice: "Vote removed!"
    else
      redirect_to @question, alert: "access denied"
    end
  end

  private

  def vote_params
  params.require(:vote).permit(:up)
  end

  def find_question
    @question = Question.find params[:question_id]
  end


end
