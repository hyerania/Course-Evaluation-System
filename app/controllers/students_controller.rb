require 'net/https'
require 'uri'

class StudentsController < ApplicationController
  def register
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
  
  def instructions
  end
  
  def login(uin)
    #first check if input is legal
    if(uin.to_i > 999999999 || uin.to_i < 100000000)
      flash[:notice] = "Please enter a valid UIN!"
      return false
    end
    
    #then validate
    @student = Student.where(uin: uin.to_i).first
    if(@student.nil?)
      flash[:notice] = "UIN not registered!"
      return false
    else
      #set session key
      session[:uin] = uin
      redirect_to controller: 'students', action: 'show'
      return true
    end
  end
    
  def show
    @student = Student.where(uin: session[:uin]).first
    if(params[:access_code].nil?)
      flash[:notice] = ""
    else
      @access_code = AccessCode.all.first
      if(@access_code.code == params[:access_code])
        redirect_to controller: 'questions', action: 'view'
      else
        flash[:notice] = "Invalid Access Code!"
      end
    end
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
        redirect_to action: "register"
      end
    else
      redirect_to action: "register"
    end
  end
  
  def validate_entry entry
    puts "validating"
    
    #nil entry
    if(entry.uin.nil? ||entry.name.nil? || entry.section.nil?)
      flash[:notice] = "Please fill in all required fields!!"
      return false
    end

    
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