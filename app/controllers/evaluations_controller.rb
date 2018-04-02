class EvaluationsController < ApplicationController
    
    #def evaluation_params
    #    params.permit(:utf8,:title,:question,:authenticity_token,:commit)
    #end
    
    def show
        session[:content]=[]
        @allevaluations=Evaluation.all
    end
    
    def new
        logger.info "new"
        logger.info session[:content]
        @questions=Question.all
        @selected_questions=[]
        if(session[:content]==nil)
            session[:content]=[]
        end
    end
    
    def create
        logger.info "create"
        #max_id=Evaluation.maximum('eid')+1
        if(params[:title]!=nil&&params[:title]!=""&&params[:questions]!=nil)
            #logger.info params[:title]
            #logger.info params[:questions]
            #logger.info (session[:content])
            
            @question=Evaluation.create!(:eid =>(Evaluation.maximum(:eid)==nil) ? 1 : Evaluation.maximum(:eid)+1,:title =>params[:title],:content =>params[:questions].values)
            flash[:notice] = "Question #{@question.title} was successfully created."
            flash.keep
        else
            flash[:error] = "Some parameter is missing."
            flash.keep
        end
        session[:content]=[]
        
        redirect_to evaluations_path
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
            session[:content] << q#Question.where(:qid => q).pluck(:content).first
        end
        puts session[:content]
        
        redirect_to new_evaluation_path
    end
    
end
