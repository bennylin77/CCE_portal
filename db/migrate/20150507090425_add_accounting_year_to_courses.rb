class AddAccountingYearToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :accounting_year, :string   
  end
end
