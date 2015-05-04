class AddPersonnelCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :personnel_code, :string        
  end
end
