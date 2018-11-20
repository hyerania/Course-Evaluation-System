class RemoveRolesRefFromUsers < ActiveRecord::Migration[5.1]
    def change 
    remove_reference(:users, :roles, foreign_key: true)
    end
end
