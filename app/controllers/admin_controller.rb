class AdminController < ApplicationController
  def show
    # uin = params[:uin] # retrieve student ID from URI route
    @students = Student.all # look up movie by unique ID
    @average=Student.all.average(:score)
    
    #control panel
    @access_code = AccessCode.all.first
    if(!params[:access_code].nil?)
      AccessCode.all.update_all(code: params[:access_code])
      redirect_to controller: 'admin', action: 'show'
    end
    
  end
end
