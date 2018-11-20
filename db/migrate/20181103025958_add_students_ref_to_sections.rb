class AddStudentsRefToSections < ActiveRecord::Migration[5.1]
  def change
    add_reference :sections, :students, foreign_key: true
  end
end
