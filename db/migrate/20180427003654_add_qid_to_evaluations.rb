class AddQidToEvaluations < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :qids, :integer, array:true, default:[]
  end
end
