class AddChoicesToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :choices, :integer, array:true, default:[]
  end
end
