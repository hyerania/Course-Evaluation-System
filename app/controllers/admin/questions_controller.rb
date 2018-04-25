class Admin::QuestionsController < ApplicationController
  
  def question_params
    params.permit(:qid, :content, :c1, :c2, :c3, :c4, :c5, :answer)
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
    @question.c5 = question_params[:c5]
    answer = question_params[:answer]

    @question.answer = @question.c1
    if answer == "2"
      @question.answer = @question.c2
    elsif answer == "3"
      @question.answer = @question.c3
    elsif answer == "4"
      @question.answer = @question.c4
    elsif answer == "5"
      @question.answer = @question.c5
    end
    
    if @question.c5 == nil
      puts 'No answer for 5'
    end
    
    @question.numAnswers = 5
    @question.save
    redirect_to action: "show"
  end

  def show
    @all_questions = Question.order(:qid)
    @num_answers = "2"
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
      @question.c5 = question_params[:c5]
      answer = question_params[:answer]
  
      @question.answer = @question.c1
      if answer == "2"
        @question.answer = @question.c2
      elsif answer == "3"
        @question.answer = @question.c3
      elsif answer == "4"
        @question.answer = @question.c4
      elsif answer == "5"
        @question.answer = @question.c5
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
      
      if @question.numAnswers == 2
        @select_options = [1, 2]  
      elsif @question.numAnswers == 3
        @select_options = [1, 2, 3]  
      elsif @question.numAnswers == 4
        @select_options = [1, 2, 3, 4]  
      elsif @question.numAnswers == 5
        @select_options = [1, 2, 3, 4, 5]
      end
      
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
