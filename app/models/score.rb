class Score < ApplicationRecord
    def self.avg_score(eid)
        return Score.where(evaluations_id: eid).average(:score)
    end
    
    def self.max_score(eid)
        return Score.where(evaluations_id: eid).maximum(:score)
        #Score.select('maximum(score)').where(evaluations_id: eid).first
    end
    
    def self.min_score(eid)
        return Score.where(evaluations_id: eid).minimum(:score)
        #Score.select('minimum(score)').where(evaluations_id: eid).first
    end
end
