require 'net/https'
require 'uri'

class StudentsController < ApplicationController
  
  def register
    @all_students = Student.all
    @student = Student.new
    @sections = Section.all.order('section_number asc')
  end
  
  def welcome
    if(!params[:uin].nil?)
      uin = params[:uin]
      if(login(uin) == true)
        redirect_to controller: 'students', action: 'show'
      else
        redirect_to conntroller: 'students', action: 'welcome'
      end
    end
  end
  
  def instructions
  end
  
  def login(uin)
    #first check if input is legal
    if(uin.to_i > 999999999 || uin.to_i < 100000000)
      flash[:warning] = "Please enter a valid UIN!"
      return false
    end
    
    #then validate
    @student = Student.where(uin: uin.to_i).first
    if(@student.nil?)
      flash[:warning] = "UIN not registered!"
      return false
    else
      #set session key
      session[:uin] = uin
      return true
    end
  end
    
  def show
    if(session[:uin].nil?)
      redirect_to controller: 'students', action: 'welcome'
    end
  
    @sections = Section.all.order('section_number asc')
    @list_of_sections = Section.pluck(:section_number).sort
    @instructions = Instruction.all.first
    
    @student = Student.where(uin: session[:uin]).first
    if(!params[:access_code].nil?)
      if(params[:access_code] == "")
        flash[:warning] = "Please enter an access code!"
        redirect_to controller: 'students', action: 'show'
      else
        @evaluations = Evaluation.where(access_code: params[:access_code]).first
        if(@evaluations.nil?)
          flash[:warning] = "Error: No evaluation exists with the corresponding access code!"
          redirect_to controller: 'students', action: 'show'
        else
          session[:eid] = @evaluations.eid
          session[:page]=0
          session[:choice]=[]
          @student.choices=[]
          @student.save
          redirect_to controller: 'questions', action: 'view'
        end
      end
    end
    
    #update student section
    if(!params[:section].nil? and !params[:uin].nil?)
      update(params[:uin], params[:section])
    end
  end
  
  def update uin,section
    @student = Student.where(uin: params[:uin].keys[0]).first
    @student.section = params[:section]
    @student.save
    redirect_to controller: 'students', action: 'show'
  end
  
  def create
    params.permit! #allow mass assignment
    @student = Student.new(params[:student])
    @student.attempts = 0
    @student.score = -1
    @student.scoretotal=-1
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
    if(entry.uin.nil? ||entry.name.nil? || entry.section.nil? || entry.name == "")
      flash[:warning] = "Please fill in all required fields!!"
      return false
    end

    
    #inavlid uin
    if(entry.uin > 999999999 || entry.uin < 100000000)
      flash[:warning] = "Invalid UIN!"
      return false
    end
    
    #uin uniqueness
    ret = Student.where(uin: entry.uin)
    if !ret.empty?
      flash[:warning] = "UIN already exist!"
      return false
    end
    
    flash[:success] = "Student Added!"
    return true
  end
  
  def logout
    session[:uin] = nil
    redirect_to controller: 'students', action: 'welcome'
  end
end
