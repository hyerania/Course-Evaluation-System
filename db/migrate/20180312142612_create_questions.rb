class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :qid
      t.string :content
      t.string :qtype
      t.string :answer
      t.string :c1
      t.string :c2
      t.string :c3
      t.string :c4
      t.string :c5
      t.string :parameters

      t.timestamps
    end
    add_index :questions, :qid
  end
end
