require 'rails_helper'

RSpec.describe Question, type: :model do
    
    before(:all) do
        @question = Question.new
        @question.qid = 9999
        @question.content = "What color is the sky?"
        @question.c1 = "Blue"
        @question.c2 = "Red"
        @question.c3 = "White"
        @question.c4 = "Pink"
        @question.c5 = "Black"
        @question.answer = "Blue"
    end
    
    it "should return correct answer is 1" do
        correct = @question.getCorrectAnswerNum
        correct.should eq(1)
    end
    
    it "should return correct answer is 2" do
        @question.answer = "Red"
        correct = @question.getCorrectAnswerNum
        correct.should eq(2)
    end
    
    it "should return correct answer is 3" do
        @question.answer = "White"
        correct = @question.getCorrectAnswerNum
        correct.should eq(3)
    end
    
    it "should return correct answer is 4" do
        @question.answer = "Pink"
        correct = @question.getCorrectAnswerNum
        correct.should eq(4)
    end
    
    it "should return correct answer is 5" do
        @question.answer = "Black"
        correct = @question.getCorrectAnswerNum
        correct.should eq(5)
    end
    
    it "should return correct answer is -1" do
        @question.answer = "None"
        correct = @question.getCorrectAnswerNum
        correct.should eq (-1)
    end
end
