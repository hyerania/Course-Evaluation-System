class AddQuestionTagsRefToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :questionTags, foreign_key: true
  end
end
