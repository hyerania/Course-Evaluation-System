class WelcomeController < ApplicationController
   
  def student_params
    params.require(:student).permit(:uin, :name, :section, :attempts, :score)
  end

  def show
    uin = params[:uin] # retrieve student ID from URI route
    @student = Students.find(uin) # look up movie by unique ID
  end
  
  def show
  end
end
