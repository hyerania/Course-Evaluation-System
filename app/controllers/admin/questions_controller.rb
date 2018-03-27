class Admin::QuestionsController < ApplicationController
  
  def question_params
    params.permit(:content, :c1, :c2, :c3, :c4, :answer)
  end
  
  def create
    @question = Question.create!(question_params)
    
    puts '--- Content ---'
    puts @question.content
    
    puts '--- Answer ---'
    puts @question.answer
    
    puts '--- Choice 1 ---'
    puts @question.c1
    
    puts '--- Choice 2 ---'
    puts @question.c2
    
    puts '--- Choice 3 ---'
    puts @question.c3
    
    puts '--- Choice 4 ---'
    puts @question.c4
    
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
