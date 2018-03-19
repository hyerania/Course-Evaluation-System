class WelcomeController < ApplicationController
   
  # def student_params
  #   params.require(:student).permit(:uin, :name, :section, :attempts, :score)
  # end

  def show
    # uin = params[:uin] # retrieve student ID from URI route
    @students = Student.all # look up movie by unique ID
    @average=Student.all.average(:score)
  end
  
end
