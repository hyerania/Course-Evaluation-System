class CreatePrivilages < ActiveRecord::Migration[5.1]
  def change
    create_table :privilages do |t|
      t.string :actionnames
      t.timestamps
    end
  end
end
