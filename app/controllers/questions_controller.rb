class QuestionsController < ApplicationController
  # the before action takes in a required first argument which references a method that will be executed before every action. You can give it a second arguement which is a hash, possible keys are :only and :excpet if you want to restrict the method calls to specific actions
  #before_action :find_question, except: [:new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize!, only: [:edit, :update, :destroy]
  #the new action is the one that is used by convention in rails to display a form to create the record (in this case question record)
  def new
    #We instantiate an instance variable of the object we'd like to create in order to use the "form_for" helper method in Rails to easily generate a form that submits to the create action
    @question = Question.new(title: "Hello") #prepopulate with the value
  end

  def create
    #params.require ensures that the params hash has a key :question and fetches all the attributes from that hash. the . permit only allows the parameters given to be mass-assigned.
    #question_params = params.require(:question).permit([:title, :body])
    #question_params => {title: "ABC", body:"xyz"}
    @question      = Question.new(question_params)
    @question.user = current_user
    if @question.save
      #flash[:notice] = "Question created!"
      #passing :notice/ :alert only works for redirect
      redirect_to question_path(@question), notice: "Question Created!"
    else
      flash[:alert] = "See errors below"
      render :new
    end
    #q.title = params[:question][:title]
    #q.body = params[:question][:body]
    #q.save
    #render text: "#{params[:question][:title]}#{params[:question][:body]}"
  end

  def show
    @answer = Answer.new
    @feedback = Feedback.new

    #@question = Question.find params[:id] #finds the params
  end
  #Get/questions
  #this is used to show a page with listing of al the questions in our DB
  def index
    if params[:search]
      @questions = Question.search(params[:search]).order(params[:order]).page(params[:page]).per(10)
    else
      @questions = Question.order(params[:order]).page(params[:page]).per(10)
    end
  end

  #GET / questions/ :id/edit (e.g /questions/123/edit)
  #this is used to show a form to edit and submit to update a question in the database
  def edit
    #redirect_to root_path, alert:"access denied" unless can? :edit, @question
    #@question = Question.find params[:id]
  end

  def update
    #this is using the strong parameters feature in Rails to only allow the title and body to be updated in the database
    #question_params = params.require(:question).permit(:title, :body)
    #@question = Question.find params[:id]
    if @question.update question_params
      #if updating the question_params is succesfull
      redirect_to question_path(@question)
      #redirecting to the question show page
    else
    render text: "update!" #or redirect_to
  end
end

  def destroy
    #@question = Question.find params[:id]
    @question.destroy
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit([:title, :body, :locked, :category_id])
  end

  def authorize!
    redirect_to root_path, alert: "access denied" unless can? :manage, @question
  end 

end
