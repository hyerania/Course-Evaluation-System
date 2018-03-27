class Admin::QuestionsController < ApplicationController
  
  def question_params
    params.permit(:content, :c1, :c2, :c3, :c4, :answer)
  end
  
  def create
    @question = Question.create!(question_params)
    redirect_to action: "show"
  end

  def show
    @all_questions = Question.all
  end

  def edit
  end

  def new
    @new_question = Question.new
  end
  
  
end
