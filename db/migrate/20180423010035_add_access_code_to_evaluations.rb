class AddAccessCodeToEvaluations < ActiveRecord::Migration[5.1]
  def change
    add_column :evaluations, :access_code, :string
  end
end
