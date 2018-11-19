class Evaluation < ApplicationRecord
    validates_uniqueness_of :eid
    attr_accessor :avg_score
    attr_accessor :max_score
    attr_accessor :min_score
end