class QuestionsController < ApplicationController
  def view
    @student = Student.where(uin: session[:uin]).first
  end

  def edit
    
  end
  
  def create

  end

  def remove
  end
end
