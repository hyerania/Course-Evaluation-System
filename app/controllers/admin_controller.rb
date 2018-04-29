class AdminController < ApplicationController
  before_action :check_admin_login, only: [:show]
  
  def login
    if(!params[:key].nil?)
      @input_hash = Digest::SHA1.hexdigest(params[:key])
      @key_hash = AdminKey.first.key
      if(@input_hash == @key_hash)
        session[:admin] = "login"
        flash[:notice] = ""
        redirect_to controller: 'admin', action: 'show'
      else
        flash[:notice] = "Incorrect Key!"
      end
    end
  end
  
  def show
    # if(session[:admin] != "login")
    #   flash.now[:danger]= "You are not logged in!"
    #   redirect_to controller: 'admin', action: 'login'
    # end
    session[:student_ids] = nil
    @all_questions = Question.order(:qid)

    @sections = Section.all.order('section_number asc')
    @list_of_sections = Section.pluck(:section_number).sort
    
    # uin = params[:uin] # retrieve student ID from URI route
    @students = Student.all.order('id asc') # look up movie by unique ID
    @average=Student.all.average(:score)
    
    #control panel
    #add new section
    if(!params[:section_number].nil? and unique_section(params[:section_number]))
      if(params[:section_number] == "")
        flash[:notice] = "Section number cannot be null!"
      else
        @new_section = Section.new
        @new_section.section_number = params[:section_number]
        @new_section.save
      end
        redirect_to controller: 'admin', action: 'show'
    end
    
    #update a student's section
    if(!params[:section].nil? and !params[:uin].nil?)
      update(params[:uin], params[:section])
    end
    
    #reset database
    if(!params[:disclaimer].nil?)
      resetStudentsDB(params[:disclaimer])
    end
  end
  
  def resetStudentsDB disclaimer
    disclaimerString = "I want to delete all students in the database, and I understand that once deleted, they are not recoverable."
    if(disclaimer == disclaimerString)
      Student.destroy_all
      flash[:notice] = "Databse Reset"
    else
      flash[:notice] = "Disclaimer does not match. Database unchanged."
    end
  end
  
  def delete
    if(session[:admin] != "login")
      # return
      redirect_to controller: 'admin', action: 'show'
    else
      Section.where(section_number: params[:value]).first.destroy
    
    #set all students with this section number their section number to null
      @students_in_this_section = Student.where(section: params[:value])
    
      for i in 0..@students_in_this_section.size - 1
        @students_in_this_section[i].section = ""
        @students_in_this_section[i].save
      end
      redirect_to controller: 'admin', action: 'show'
      
    end
  end
  
  def unique_section entry
    ret = Section.where(section_number: entry)
    if !ret.empty?
      flash[:notice] = "Section already exists!"
      return false
    else
      return true
    end
  end
  
  def update uin,section
    @student = Student.where(uin: params[:uin].keys[0]).first
    @student.section = params[:section]
    @student.save
    redirect_to controller: 'admin', action: 'show'
  end
  
  def logout
    session[:admin] = ""
    redirect_to controller: 'admin', action: 'show'
  end
  
  def logged_in?
      session[:admin] == "login"
  end
      
  def check_admin_login
    unless logged_in?
        redirect_to controller: 'admin', action: 'login'
    end
  end
  
  def export
      if(params[:display_all] == "1")
        @students = Student.all
      else
        if(params[:student_ids].nil?)
          if(session[:student_ids].nil?)
            @students = Student.all
          else
            @students = Student.where(id: session[:student_ids])
          end
        else
          @students = Student.where(id: params[:student_ids])
          session[:student_ids] = params[:student_ids]
        end  
      end
    respond_to do |format|
      format.html
      format.csv{send_data @students.to_csv,:filename => "students.csv", :disposition => 'attachment' }
    end
  end
  
  def export_questions
    @questions=Question.all
    respond_to do |format|
      format.html
      format.csv{send_data @questions.to_csv,:filename => "questions.csv", :disposition => 'attachment' }
    end
  end
end
