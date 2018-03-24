class EvaluationController < ApplicationController
    
    def show
        @questions=Question.all
    end
    
    def selectq
        logger.info params[:id]
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