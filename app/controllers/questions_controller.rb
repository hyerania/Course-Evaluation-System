class QuestionsController < ApplicationController
  before_action :set_page, only: [:view]
  QUESTIONS_PER_PAGE = 1
  def view
    questions=[]
    @evaluation = Evaluation.pluck(:content).last
    @evaluation.each do |question|
      questions << question
    end
      @questions=Question.where(:content => questions).limit(QUESTIONS_PER_PAGE).offset(@page*QUESTIONS_PER_PAGE)
  end
  private
    def set_page
       @page = params[:page].to_i || 0
    end
  def edit
    
  end
   
  def create

  end

  def remove
  end
end
