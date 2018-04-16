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
    
    if params[:commit]==nil||params[:commit]=="Next"
      questions=[]
      @evaluation = Evaluation.pluck(:content).last
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
      
      if session[:page]==nil
        session[:page]=0
      end
      
      #commented out for testing
      
      if params[:commit]!=nil&&params[:commit]=="Next"&&params[:page]!=nil&&params[:page].to_i>session[:page]&&params[:choice]!=nil
        puts "set page allowed"
        session[:page] = (params[:page]).to_i
      else
        puts "set page denied"
      end
    end
  

  
  def edit
    
  end
   
  def create

  end

  def remove
  
  end
  
end
