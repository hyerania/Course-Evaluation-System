require 'net/https'
require 'uri'

class StudentsController < ApplicationController
  def register
    @all_students = Student.all
    
    @student = Student.new
    
    @sections = Section.all.order('section_number asc')
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
    if(session[:uin].nil?)
      redirect_to controller: 'students', action: 'welcome'
    end
  
    @sections = Section.all.order('section_number asc')
    @list_of_sections = Section.pluck(:section_number).sort
  
    @student = Student.where(uin: session[:uin]).first
    if(params[:access_code].nil?)
      flash[:notice] = ""
    else
      @access_code = AccessCode.all.first
      if(@access_code.code == params[:access_code])
        session[:page]=0
        session[:choice]=[]
        redirect_to controller: 'questions', action: 'view'
      else
        flash[:notice] = "Invalid Access Code!"
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
  
  def logout
    session[:uin] = nil
    redirect_to controller: 'students', action: 'welcome'
  end
   #https://gorails.com/episodes/export-to-csv
   
  # def index
  #   debugger
  #   case params[:commit]
    
  #   when "To CSV" then send_data @students.to_csv(@student_ids), filename: 'students.csv'
  #   end
  # end
  
  def index
    if(params[:display_all] == "1")
      @students = Student.all
    else
      if(params[:student_ids].nil?)
        if(session[:student_ids].nil?)
          @students = Student.all
          puts '1'
        else
          @students = Student.where(id: session[:student_ids])
          puts '2'
        end
      else
        @students = Student.where(id: params[:student_ids])
        session[:student_ids] = params[:student_ids]
        puts '3'
      end  
    end
    
    respond_to do |format|
      format.html
      format.csv{send_data @students.to_csv,:filename => "students.csv", :disposition => 'attachment' }
    end
  end
  #http://www.thegreatcodeadventure.com/exporting-csv-from-rails/
  #https://medium.com/coderaga/rails-import-export-csv-data-without-gem-fbf2a36a84f6
end
  
  