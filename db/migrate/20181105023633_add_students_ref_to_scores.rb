class AddStudentsRefToScores < ActiveRecord::Migration[5.1]
  def change
    add_reference :scores, :students, foreign_key: true
  end
end
