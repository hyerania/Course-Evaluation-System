#$global_question_choice_counter={}

class QuestionsController < ApplicationController
  before_action :set_page, only: [:view]
  QUESTIONS_PER_PAGE = 1
  
  def save
    puts "save!"
    
    score=0
    i=0
    
    @evaluation = Evaluation.pluck(:content).last
    @this_evaluation=Evaluation.last
    
    @student=Student.where(:uin=>session[:uin]).first
    
    choices_seen=0
    
    #puts @this_evaluation.scales
    
    total_score=0
    
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
      
      temp_question=Question.where(:content => question).first
      
      temp_question_choice_count=0
      
      temp_question_max_score=0
      
      if temp_question.c1!=nil then temp_question_choice_count+=1 end
      if temp_question.c2!=nil then temp_question_choice_count+=1 end
      if temp_question.c3!=nil then temp_question_choice_count+=1 end
      if temp_question.c4!=nil then temp_question_choice_count+=1 end
      if temp_question.c5!=nil then temp_question_choice_count+=1 end
      
      
      if @student.choices[i].to_i==temp_question.getCorrectAnswerNum then puts"correct" end
      score+=@this_evaluation.scales[choices_seen+@student.choices[i].to_i-1]
      temp_question_max_score=@this_evaluation.scales[choices_seen..(choices_seen+temp_question_choice_count)].max
      #end
      i+=1
      choices_seen+=temp_question_choice_count
      total_score+=temp_question_max_score
    end
    puts "score:"
    puts score
    puts total_score
    
    session[:choice]=[]
    
    @student.score=score
    @student.scoretotal=total_score
    @student.attempts+=1
    @student.choices=[]
    @student.save
    
    #puts $global_question_choice_counter
    
    redirect_to students_show_path()
  end
  
  
  def view
    @student=Student.where(:uin=>session[:uin]).first
    @evaluation = Evaluation.where(eid: session[:eid]).pluck(:content).first
    @questions=Question.where(:content => @evaluation[@student.choices.count])
    
    if params[:commit]=="Next"||params[:commit]=="Submit"
      #puts "backarrow:"
      #puts params[:page]
      #puts @student.choices.count
      if params[:page].to_i==@student.choices.count+((params[:stat]=="success"||params[:stat]=="noanswer"||params[:stat]=="goback")?0:1)
        #puts "here1"
        if params[:choice]!=nil&&params[:choice].length>0
          #if params[:page].to_i==@student.choices.count+1
          
            puts "we are on the same page"
            
            flash.discard
            
            @this_question=Question.where(:content => @evaluation[@student.choices.count]).first
            
            
            if params[:choice]=="1" then @this_question.c1_count+=1
            elsif params[:choice]=="2" then @this_question.c2_count+=1
            elsif params[:choice]=="3" then @this_question.c3_count+=1
            elsif params[:choice]=="4" then @this_question.c4_count+=1
            elsif params[:choice]=="5" then @this_question.c5_count+=1
            end
            
            @this_question.save
            
            
            @student.choices=@student.choices << params[:choice].to_i
            @student.save
            #@student
          
            puts @student.choices
            if params[:commit]=="Submit"
              redirect_to :controller=> "questions", :action=> "save"
            else
              redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next", stat:"success"
            end
            
          #else
          #  #puts "back to your previous page"
          #  @questions=Question.where(:content => @evaluation[@student.choices.count])
          #  redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next", stat:"goback"
          #end
        elsif params[:commit]=="Next"||params[:commit]=="Submit"
          if params[:stat]=="goback"
            flash[:warning] = "Don't even think about going back!"
          elsif params[:stat]=="success"
            #flash[:success] = "Choice saved!"
          elsif params[:stat]=="noanswer"
            flash[:warning] = "You have to pick an answer"
          else
            @questions=Question.where(:content => @evaluation[@student.choices.count])
            redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next",stat:"noanswer"
          end
        end
        
        @questions=Question.where(:content => @evaluation[@student.choices.count])
      
      else
        #puts "here2"
        @questions=Question.where(:content => @evaluation[@student.choices.count])
        if params[:stat]!="goback"
          redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next", stat:"goback"
        end
      end
      
      
    # elsif params[:commit]=="Submit"
    
    #   if params[:choice]!=nil&&params[:choice].length>0
    #     #update answer
    #     #puts Question.where(:content => @evaluation[@student.choices.count]).pluck(:qid).first
    #     if params[:page].to_i==@student.choices.count+1
    #       puts "we are on the same page"
          
    #       @this_question=Question.where(:content => @evaluation[@student.choices.count]).first
          
          
    #       if params[:choice]=="1" then @this_question.c1_count+=1
    #       elsif params[:choice]=="2" then @this_question.c2_count+=1
    #       elsif params[:choice]=="3" then @this_question.c3_count+=1
    #       elsif params[:choice]=="4" then @this_question.c4_count+=1
    #       elsif params[:choice]=="5" then @this_question.c5_count+=1
    #       end
          
    #       @this_question.save
          
          
    #       @student.choices=@student.choices << params[:choice].to_i
    #       @student.save
    #       #@student
        
    #       puts @student.choices
          
          
    #       redirect_to :controller=> "questions", :action=> "save"
    #     else
    #       @questions=Question.where(:content => @evaluation[@student.choices.count])
    #       redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next", stat:"goback"
    #     end
        
    #   elsif true
    #     if params[:stat]=="goback"
    #       flash[:warning] = "Don't even think about going back!"
    #     else
    #       flash[:warning] = "You have to pick an answer"
    #       #redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next"
    #     end
        
    #   end
      
    #   @questions=Question.where(:content => @evaluation[@student.choices.count])
      
    #   #redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next"
    elsif (params[:commit]!="Submit"&&@student.choices.count==0)
      @questions=Question.where(:content => @evaluation[@student.choices.count])
    elsif true
      flash.discard
      flash[:warning] = "Don't even think about going back!"
      redirect_to controller: 'questions', action: 'view', page:@student.choices.count, commit:"Next", stat:"goback"
    end
    
    #puts @questions[0].content
    
  end
  private
    def set_page
      #puts "session before:"
      #puts session[:page]
      #puts params[:page]
      if(session[:uin].nil?)
        redirect_to controller: 'students', action: 'welcome'
      end
      
      
      #commented out for testing
      
      if params[:commit]!=nil&&params[:commit]=="Next"&&params[:page]!=nil&&params[:choice]!=nil
        puts "set page allowed"
      end
      
      #puts "session after:"
      #puts session[:page]
      
    end
  

  
  def edit
    
  end
   
  def create

  end

  def remove
  
  end
  
end
