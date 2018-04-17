class AddCountToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :c1_count, :integer
    add_column :questions, :c2_count, :integer
    add_column :questions, :c3_count, :integer
    add_column :questions, :c4_count, :integer
    add_column :questions, :c5_count, :integer
  end
end
