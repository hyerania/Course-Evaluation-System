class RemovePrivilageRefFromRoles < ActiveRecord::Migration[5.1]
  def change 
    
    remove_reference(:roles, :privilages, foreign_key: true)
  
  end
end
