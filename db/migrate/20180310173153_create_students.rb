class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :uin
      t.string :name
      t.integer :section
      t.integer :attempts
      t.integer :score
      t.datetime :last_start
      t.datetime :last_end

      t.timestamps
    end
    add_index :students, :uin
  end
end
