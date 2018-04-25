class AddScoretotalToStudents < ActiveRecord::Migration[5.1]
  def change
    # this is the total score of the last evaluation the student has taken
    add_column :students, :scoretotal, :integer, default:0
  end
end
