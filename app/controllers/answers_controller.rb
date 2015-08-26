class AnswersController < ApplicationController
  def create
    @answer   = Answer.new answer_params
    # @answer = @question.answers.new(answer_params)
    @question = Question.find params[:question_id]
    @answer.question = @question
    @answer.save
    if @answer.save
    redirect_to question_path(@question), notice: "Answer Created!"
    else
      flash[:alert] = "Answer wasn't created"
      #this will render show.html.erb within questions folder (in views)
      #we are choosing to use "render" in here because we want to **display**
      #the errors resulting from unsuccessful save of @answer. The errors
      #are attached to the @answer object and can be accessed in:
      #@answer.errors
      #using redirect makes a whole new request cycles so we lose the @answer
      #object
      render "/questions/show"
    end
  end

  def destroy
    @question = Question.find params[:question_id]
    @answer   = Answer.find params[:id] #specific to answers DB
    @answer.destroy
    redirect_to question_path(@question), notice: "Answer deleted."
  end


  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
