class EvaluationController < ApplicationController
    
    def show
        @questions=Question.all
    end
    
    def selectq
        logger.info params[:id]
    end
    
    def save

    end
end