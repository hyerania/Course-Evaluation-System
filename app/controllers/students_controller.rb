require 'net/https'
require 'uri'

class StudentsController < ApplicationController
  def hello
    flash[:notice] = ""
    @all_students = Student.all
    
    @student = Student.new
  end
  
  def welcome
    flash[:notice] = ""
    if(!params[:uin].nil?)
      uin = params[:uin]
      login(uin)
    end
  end
  
  def login(uin)
   if(uin.to_i > 999999999 || uin.to_i < 100000000)
      flash[:notice] = "Please enter a valid UIN!"
      return false
    end
    @student = Student.where(uin: uin.to_i).first
    if(@student.nil?)
      flash[:notice] = "UIN not registered!"
      return false
    else
      redirect_to controller: 'students', action: 'show', uin: uin
      return true
    end
  end
    
  def show
    @student = Student.where(uin: params[:uin].to_i).first
  end
  
  def create
    flash[:notice] = ""
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