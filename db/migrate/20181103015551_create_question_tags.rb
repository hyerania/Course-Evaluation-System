class CreateQuestionTags < ActiveRecord::Migration[5.1]
  def change
    create_table :question_tags do |t|
      t.string :tagname
      t.timestamps
    end
  end
end
