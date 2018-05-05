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
    
    def self.to_csv
        attributes = %w{qid c1_count c2_count c3_count c4_count c5_count}
        CSV.generate(headers: true) do |csv|
          csv << attributes
          all.each do |question| csv << question.attributes.values_at(*attributes)
          end
        end
    end
    
end
