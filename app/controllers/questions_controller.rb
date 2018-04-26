$global_question_choice_counter={}

class QuestionsController < ApplicationController
  before_action :set_page, only: [:view]
  QUESTIONS_PER_PAGE = 1
  
  def save
    puts "save!"
    session[:page]=0
    
    puts "session choice"
    puts session[:choice]
    
    score=0
    i=0
    
    @evaluation = Evaluation.pluck(:content).last
    
    @evaluation.each do |question|
      
      #question_choice_stat
      #if $global_question_choice_counter[question][session[:choice][i]]!=nil
      #  $global_question_choice_counter[question][session[:choice][i]]+=1
      #else
      #  $global_question_choice_counter[question][session[:choice][i]]=1
      #end
      
      #puts session[:choice][i]
      #puts "|"
      #puts Question.where(:content => question).pluck(:answer).first
      if session[:choice][i]==Question.where(:content => question).pluck(:answer).first
        score+=1
      end
      i+=1
    end
    puts "score:"
    puts score
    
    session[:choice]=[]
    
    @student=Student.where(:uin=>session[:uin]).first
    @student.score=score
    @student.attempts+=1
    @student.save
    
    #puts $global_question_choice_counter
    
    redirect_to students_show_path()
  end
  
  
  def view
    session[:eid]
    @evaluation = Evaluation.where(eid: session[:eid]).pluck(:content).first
    if params[:commit]==nil||params[:commit]=="Next"
      questions=[]
      @evaluation.each do |question|
        questions << question
      end
      @questions=Question.where(:content => questions).limit(QUESTIONS_PER_PAGE).offset(session[:page]*QUESTIONS_PER_PAGE)
      #@questions=Question.where(:content => @evaluation[@page])
      if session[:choice]==nil
        session[:choice]=[]
      elsif params[:choice]!=nil&&params[:choice].length>0
        session[:choice] << params[:choice]
      end
    else
      session[:choice] << params[:choice]
      
      redirect_to :controller=> "questions", :action=> "save"
    end
  end
private
  def set_page
    if(session[:uin].nil?)
      redirect_to controller: 'students', action: 'welcome'
    end
    
      if session[:page]==nil
        session[:page]=0
      end
      flash[:notice]=""
      if params[:commit]=="Next"&&params[:page].to_i>session[:page]&&params[:choice]!=nil
        session[:page] = (params[:page]).to_i
      elsif params[:choice]==nil && params[:commit]=="Next" || params[:choice] == nil && params[:commit] == "Submit"
        params[:commit] = "Next"
        flash[:notice] = "You have to pick an answer."
      else

      end
    end
  

  
  def edit
    
  end
   
  def create

  end

  def remove
  
  end
  
end
