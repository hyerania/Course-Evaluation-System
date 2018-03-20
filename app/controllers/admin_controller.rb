class AdminController < ApplicationController
  def show
    # uin = params[:uin] # retrieve student ID from URI route
    @students = Student.all # look up movie by unique ID
    @average=Student.all.average(:score)
  end
end
