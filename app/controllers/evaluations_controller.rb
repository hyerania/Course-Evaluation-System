class EvaluationsController < ApplicationController
    
    def show
        if(session[:admin] != "login")
          redirect_to controller: 'admin', action: 'login'
        end

        @instructions = Instruction.all.first
        session[:content]=[]
        session[:title]=""
        @allevaluations=Evaluation.all.order('eid asc')
        
        #update evaluation access_code
        if(!params[:access_code].nil? and !params[:eid].nil?)
            if(check_access_code_uniqueness(params[:access_code]) == true)
              update(params[:access_code], params[:eid]) 
            else
              flash[:notice] = "Access code already exists for another evaluation!"
            end
        end
    end
    
    def new
        if(session[:admin] != "login")
          redirect_to controller: 'admin', action: 'login'
        end
        
        logger.info "new"
        logger.info session[:content]
        @questions=Question.all
        @selected_questions=[]
        if session[:title]==nil then session[:title]="" end
    end
    
    def create
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
                flash.keep
                
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
    
    def update_instructions
        @instructions = Instruction.all.first
        @instructions.content = params[:content]
        @instructions.save
        flash[:notice] = "Instruction updated!"
        redirect_to('/admin/evaluations')
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
    
    def update access_code, eid
       @evaluation = Evaluation.where(eid: params[:eid].keys[0]).first
       @evaluation.access_code = access_code
       @evaluation.save
       redirect_to controller: 'evaluations', action: 'show'
    end
    
    def check_access_code_uniqueness code
      @evaluation = Evaluation.where(access_code: code)
      if(@evaluation.size == 0)
          return true
      else
          return false
      end
    end
end
