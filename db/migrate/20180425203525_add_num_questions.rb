class AddNumQuestions < ActiveRecord::Migration[5.1]
  def change
      add_column :questions, :numAnswers, :integer, null: false
  end
end
