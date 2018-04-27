class AdminController < ApplicationController
  def login
    if(!params[:key].nil?)
      @input_hash = Digest::SHA1.hexdigest(params[:key])
      @key_hash = AdminKey.first.key
      if(@input_hash == @key_hash)
        session[:admin] = "login"
        redirect_to controller: 'admin', action: 'show'
      else
        flash[:notice] = "Incorrect Key!"
      end
    end
  end
  
  def show
    if(session[:admin] != "login")
      redirect_to controller: 'admin', action: 'login'
    end
    
    @sections = Section.all.order('section_number asc')
    @list_of_sections = Section.pluck(:section_number).sort
    
    # uin = params[:uin] # retrieve student ID from URI route
    @students = Student.all.order('id asc') # look up movie by unique ID
    @average=Student.all.average(:score)
    
    #control panel
    @access_code = AccessCode.all.first
    if(!params[:access_code].nil?)
      AccessCode.all.update_all(code: params[:access_code])
      redirect_to controller: 'admin', action: 'show'
    end
    
    #add new section
    if(!params[:section_number].nil? and unique_section(params[:section_number]))
      @new_section = Section.new
      @new_section.section_number = params[:section_number]
      @new_section.save
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
    Section.where(section_number: params[:value]).first.destroy
    
    #set all students with this section number their section number to null
    @students_in_this_section = Student.where(section: params[:value])
    
    for i in 0..@students_in_this_section.size - 1
      @students_in_this_section[i].section = ""
      @students_in_this_section[i].save
    end
    
    redirect_to controller: 'admin', action: 'show'
  end
  
  def unique_section entry
    ret = Section.where(section_number: entry)
    if !ret.empty?
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
  
  # def index
  # @students=Student.all
  # @selected_students = Student.where(id: params[:student_ids])
  # puts @selected_students
  # if(@selected_students.count > 0)
  #   session[:selected_students] = @selected_students
  #   redirect_to('/admin/students.csv')
  # end
  # end
  
  # def students
  #   @selected_students = session[:selected_students]
  #     respond_to do |format|
  #     format.html
  #     format.csv{send_data @selected_students.to_csv,:filename => "students.csv", :disposition => 'attachment' }
  #   end
  #   return
  # end
end
