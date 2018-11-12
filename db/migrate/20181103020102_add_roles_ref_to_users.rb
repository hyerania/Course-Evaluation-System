class AddRolesRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :roles, foreign_key: true
  end
end
