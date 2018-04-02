class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :eid
      t.string :title
      t.string :content, array:true, default:[]
    end
  end
end
