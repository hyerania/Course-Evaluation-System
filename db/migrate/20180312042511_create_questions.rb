class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :qid
      t.string :content
      t.string :type
      t.string :answer

      t.timestamps
    end
    add_index :questions, :qid
  end
end
