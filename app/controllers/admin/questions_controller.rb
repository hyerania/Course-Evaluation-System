class Admin::QuestionsController < ApplicationController
  
  def question_params
    params.permit(:qid, :content, :c1, :c2, :c3, :c4, :answer)
  end
  
  def create
    @all_questions = Question.all
    last_question =  @all_questions.last
    
    @question = Question.new
    @question.qid = last_question.qid + 1
    @question.content = question_params[:content]
    @question.c1 = question_params[:c1]
    @question.c2 = question_params[:c2]
    @question.c3 = question_params[:c3]
    @question.c4 = question_params[:c4]
    answer = question_params[:answer]

    @question.answer = @question.c1
    if answer == "2"
      @question.answer = @question.c2
    elsif answer == "3"
      @question.answer = @question.c3
    elsif answer == "4"
      @question.answer = @question.c4
    end
    
    
    @question.save
    redirect_to action: "show"
  end

  def show
    @all_questions = Question.order(:qid)
    
  end

  def update
    qid = question_params[:qid].to_i
    
    questions = Question.where(qid: qid)
    
    if questions.count == 0
      flash[:warning] = "Unable to find question. Please try again."
      redirect_to action: "show"
    else
      @question = questions[0]
      @question.content = question_params[:content]
      @question.c1 = question_params[:c1]
      @question.c2 = question_params[:c2]
      @question.c3 = question_params[:c3]
      @question.c4 = question_params[:c4]
      answer = question_params[:answer]
  
      @question.answer = @question.c1
      if answer == "2"
        @question.answer = @question.c2
      elsif answer == "3"
        @question.answer = @question.c3
      elsif answer == "4"
        @question.answer = @question.c4
      end
      
      @question.save
      flash[:success] = "Question #{@question.qid} successfully updated."
      redirect_to action: "show"
    end
  end

  def edit
    
    questions = Question.where(qid: params[:id])
    if questions.count == 0
      flash[:warning] = "Unable to find question. Please try again."
      redirect_to action: "show"
    else
      @question = questions[0]
      @answer = @question.getCorrectAnswerNum
    end
      
  end
  

  def new
    @new_question = Question.new
  end
  
  
  def delete
    questions = Question.where(qid: params[:id])
    if questions.count == 0
      flash[:warning] = "Unable to find question. Please try again."
      redirect_to action: "show"
    else
      @question = questions[0]
      @question.delete
      flash[:success] = "Question #{@question.qid} successfully deleted."
      redirect_to action: "show"
    end
    

  end
  
end
