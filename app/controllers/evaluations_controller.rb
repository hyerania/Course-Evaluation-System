class EvaluationsController < ApplicationController
    
    def show
        session[:content]=[]
        @allevaluations=Evaluation.all
    end
    
    def new
        logger.info "new"
        logger.info session[:content]
        @questions=Question.all
        @selected_questions=[]
    end
    
    def create
        logger.info "create"
        if(params[:title]!=nil&&params[:title]!=""&&params[:questions]!=nil)
            @question=Evaluation.create!(:eid =>(Evaluation.maximum(:eid)==nil) ? 1 : Evaluation.maximum(:eid)+1,:title =>params[:title],:content =>params[:questions].values)
            flash[:notice] = "Question #{@question.title} was successfully created."
            flash.keep
            
            redirect_to action: "show"
        else
            flash[:error] = "Some parameter is missing."
            flash.keep
        end
        session[:content]=[]
        
        
    end
    
    def selectr
        logger.info "selectr"
        session[:content]=[]
        already_seen = []
        size=3
        if(params[:size]!=nil)
            size=params[:size].to_i
        end
        
        while already_seen.length<size do 
            if already_seen == []
                id = Question.order('RANDOM()').pluck(:qid).first
                already_seen << id
            else
                id = Question.order('RANDOM()').where.not(qid: already_seen).pluck(:qid).first
                already_seen << id
            end
        end
        already_seen.each do |q|
            session[:content] << q
        end
        puts session[:content]
        
        redirect_to new_evaluation_path
    end
    
end
