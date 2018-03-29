class StudentsController < ApplicationController
  def hello
    @all_students = Student.all
    
    @student = Student.new
  end
  
  def create
    params.permit! #allow mass assignment
    @student = Student.new(params[:student])
    @student.attempts = 0
    @student.score = -1
    @student.created_at =  DateTime.now
    res = validate_entry(@student)
    #debugger
    if(res == true)
      if(@student.save)
        redirect_to action: "hello"
      end
    else
      redirect_to action: "hello"
    end
  end
  
  def validate_entry entry
    puts "validating"
    
    #inavlid uin
    if(entry.uin > 999999999 || entry.uin < 100000000)
      flash[:notice] = "Invalid UIN!"
      return false
    end
    
    #uin uniqueness
    ret = Student.where(uin: entry.uin)
    if !ret.empty?
      flash[:notice] = "UIN already exist!"
      return false
    end
    
    flash[:notice] = "Student Added!"
    
    return true
  end
end