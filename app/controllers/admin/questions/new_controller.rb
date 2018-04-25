class Admin::Questions::NewController < ApplicationController
  def c2
    @new_question = Question.new
  end

  def c3
    @new_question = Question.new
  end

  def c4
    @new_question = Question.new
  end

  def c5
    @new_question = Question.new
  end
  
  def show
    
    numAnswers = params['answer']
    puts numAnswers
    
    if numAnswers == "2"
      redirect_to '/admin/questions/new/c2'
    elsif numAnswers == "3"
      redirect_to '/admin/questions/new/c3'
    elsif numAnswers == "4"
      redirect_to '/admin/questions/new/c4'
    elsif numAnswers == "5"
      redirect_to '/admin/questions/new/c5'
    else
      redirect_to '/'
    end
        
  end

end
