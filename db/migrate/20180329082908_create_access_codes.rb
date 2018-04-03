class CreateAccessCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :access_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
