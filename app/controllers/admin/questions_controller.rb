class Admin::QuestionsController < ApplicationController
  
  def question_params
    params.permit(:qid, :content, :c1, :c2, :c3, :c4, :c5, :answer, :numAnswers)
  end
  
  def create
    puts question_params
    
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
    
    @question.numAnswers = params[:numAnswers].to_i
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
      puts question_params
      
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
      
      puts @question.answer
      @question.save
      flash[:success] = "Question #{@question.qid} successfully updated."
      redirect_to action: "show"
    end
  end

  def edit
    puts params
    questions = Question.where(qid: params[:id])
    if questions.count == 0
      flash[:warning] = "Unable to find question. Please try again."
      redirect_to action: "show"
    else
      @question = questions[0]
      @answer = @question.getCorrectAnswerNum
      puts @question.numAnswers
      if @question.numAnswers == 2
        redirect_to "/admin/questions/edit/c2/#{@question.qid}"
      elsif @question.numAnswers == 3
        redirect_to "/admin/questions/edit/c3/#{@question.qid}"
      elsif @question.numAnswers == 4
        redirect_to "/admin/questions/edit/c4/#{@question.qid}"
      elsif @question.numAnswers == 5
        redirect_to "/admin/questions/edit/c5/#{@question.qid}"
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
  
  def copy
  
    questions = Question.where(qid: params[:id])
    if questions.count == 0
      flash[:warning] = "Unable to find question. Please try again."
      redirect_to action: "show"
    else
      all_questions = Question.all
      question = questions[0]
      last_question =  all_questions.last

      new_question = Question.new
      new_question.qid = last_question.qid + 1
      new_question.content = question.content
      new_question.qtype = question.qtype
      new_question.answer = question.answer
      new_question.c1 = question.c1
      new_question.c2 = question.c2
      new_question.c3 = question.c3
      new_question.c4 = question.c4
      new_question.c5 = question.c5
      new_question.answer = question.answer
      new_question.parameters = question.parameters
      new_question.c1_count = 0
      new_question.c2_count = 0
      new_question.c3_count = 0
      new_question.c4_count = 0
      new_question.c5_count = 0
      new_question.numAnswers = question.numAnswers
      new_question.save!
      flash[:success] = "Question #{question.qid} successfully copied."
      redirect_to action: "show"
    end
    
  end
  
end
