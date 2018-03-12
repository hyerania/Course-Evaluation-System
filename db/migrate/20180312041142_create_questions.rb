class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :id
      t.string :content
      t.string :type
      t.string :answer

      t.timestamps
    end
    add_index :questions, :id
  end
end
