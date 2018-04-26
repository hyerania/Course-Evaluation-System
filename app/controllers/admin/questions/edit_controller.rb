class Admin::Questions::EditController < ApplicationController
  def c2
    questions = Question.where(qid: params[:id])
    @question = questions[0]
    @answer = @question.getCorrectAnswerNum
  end

  def c3
    questions = Question.where(qid: params[:id])
    @question = questions[0]
    @answer = @question.getCorrectAnswerNum
  end

  def c4
    questions = Question.where(qid: params[:id])
    @question = questions[0]
    @answer = @question.getCorrectAnswerNum
  end

  def c5
    questions = Question.where(qid: params[:id])
    @question = questions[0]
    @answer = @question.getCorrectAnswerNum
  end
end
