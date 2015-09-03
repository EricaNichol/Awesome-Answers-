class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    question = Question.find params[:question_id]
    favorite = Favorite.new(question: question, user: current_user)
    if favorite.save
      redirect_to question, notice:"Favorited"
    else
      redirect_to question, alert:"Can't Favorite"
    end
  end

  def destroy
    favorite  = Favorite.find params[:id]
    if can? :destroy, favorite
      question = Question.find params[:question_id]
      favorite.destroy
      redirect_to question_path(question), notice:"Un-Favorite"
    else
      redirect_to root_path, alert: "access denied"
    end
  end

  private

  def find_question
    @question = Question.find params[:question_id]
  end
end
