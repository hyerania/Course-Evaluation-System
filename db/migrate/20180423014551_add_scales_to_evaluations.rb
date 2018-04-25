class AddScalesToEvaluations < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :scales, :integer, array:true, default:[]
  end
end
