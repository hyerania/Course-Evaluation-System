class EvaluationController < ApplicationController
    
    def new
        @selected_questions={}
        
        @questions={}
    end
    
    def show
        @selected_questions= if session[:selected_questions]==nil then {} else session[:selected_questions] end
        @questions= if session[:questions]==nil then {} else session[:questions] end
        
        if session[:questions]==nil 
            
            temp_qs = Question.order(:qid).where.not(qid: @selected_questions.keys)
            
            temp_qs.each do |q|
                @questions[q.qid]=q
            end
        end
        
    end
    
    def selectq
        @selected_questions= if session[:selected_questions]==nil then {} else session[:selected_questions] end
        @questions= if session[:questions]==nil then {} else session[:questions] end
        
        temp_qid=params[:id]
        logger.info puts (temp_qid)
        if @questions[temp_qid]!=nil && @selected_questions[temp_qid]==nil
            @selected_questions[temp_qid]=@questions[temp_qid]
            @questions.delete(temp_qid)
        end
    end
    
    
    def unselectq
        
        @selected_questions= if session[:selected_questions]==nil then {} else session[:selected_questions] end
        @questions= if session[:questions]==nil then {} else session[:questions] end
        
        
        temp_qid=params[:id]
        logger.info puts (temp_qid)
        if @selected_questions[temp_qid]!=nil && @questions[temp_qid]==nil
            @questions[temp_qid]=@selected_questions[temp_qid]
            @selected_questions.delete(temp_qid)
        end
    end
    
    def selectr
        #Question.uncached do 
        already_seen = []
        while already_seen.length<3 do
            question = Question.order('RANDOM()').where.not(qid: already_seen).first
            already_seen << question.qid
        end
        #end
        puts already_seen
        already_seen.each do |q|
            puts Question.find_by_qid(q)
        end
    end
    
    def save
        logger.info puts ("Hi")
    end
end