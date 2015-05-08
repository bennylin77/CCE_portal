class AddDefaultValueToPersonnelCode < ActiveRecord::Migration
  def change
    remove_column :users, :personnel_code 
    add_column :users, :personnel_code, :string, default: '0000'            
  end
end
