class AddPrivilagesRefToRoles < ActiveRecord::Migration[5.1]
  def change
    add_reference :roles, :privilages, foreign_key: true
  end
end
