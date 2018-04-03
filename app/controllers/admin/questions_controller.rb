class Admin::QuestionsController < ApplicationController
  
  def question_params
    params.permit(:content, :c1, :c2, :c3, :c4, :answer)
  end
  
  def create
    @all_questions = Question.all
    last_question =  @all_questions.last
    
    @question = Question.new
    @question.qid = last_question.qid + 1
    @question.content = question_params[:content]
    @question.c1 = question_params[:c1]
    @question.c2 = question_params[:c2]
    @question.c3 = question_params[:c3]
    @question.c4 = question_params[:c4]
    @question.answer = question_params[:answer]
    @question.save
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
