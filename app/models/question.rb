class Question < ApplicationRecord
    
    def getCorrectAnswerNum
        
        correct = -1
        
        if self.c1 == self.answer
            correct = 1
        elsif self.c2 == self.answer
            correct = 2
        elsif self.c3 == self.answer
            correct = 3
        elsif self.c4 == self.answer
            correct = 4
        elsif self.c5 == self.answer
            correct = 5
        end
        
        return correct
    
    end
    
end
