class EvaluationsController < ApplicationController
    
    def show
        session[:content]=[]
        session[:title]=""
        @allevaluations=Evaluation.all
    end
    
    def new
        logger.info "new"
        logger.info session[:content]
        @questions=Question.all.order(:qid)
        @selected_questions=[]
        if session[:title]==nil then session[:title]="" end
    end
    
    def create
        flash[:error] = ""
        if params[:commit]!=nil&&params[:commit]=="Random"&&params[:size]!=""
            if params[:title]!=nil&&params[:title]!=""
                session[:title]=params[:title]
            end
            puts session[:title]
            redirect_to selectr_evaluation_path("size":params[:size].to_i)
        else
            logger.info "create"
            if(params[:title]!=nil&&params[:title]!=""&&params[:questions]!=nil)
                @question=Evaluation.create!(:eid =>(Evaluation.maximum(:eid)==nil) ? 1 : Evaluation.maximum(:eid)+1,:title =>params[:title],:content =>params[:questions].values)
                flash[:notice] = "Question #{@question.title} was successfully created."
                #flash.keep
                
                redirect_to action: "show"
            else
                flash[:error] = "Some parameter is missing."
                session[:content]=[]
                if params[:questions]!=nil
                    params[:questions].keys.each do |q|
                        session[:content] << q.to_i
                    end
                end
                redirect_to new_evaluation_path
            end
            #session[:content]=[]
            
        end
        
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
    
    def edit
    
    end
    
    def update
    
    end
    
    def destroy
    
    end
end
