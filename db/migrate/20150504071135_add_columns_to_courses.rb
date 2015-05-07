class AddColumnsToCourses < ActiveRecord::Migration
  def change

    add_column :courses, :note, :string   
    add_column :courses, :code, :string
           
    add_column :courses, :grants, :integer
    add_column :courses, :total_tuition, :integer
    add_column :courses, :other_funds, :integer      
        
    add_column :courses, :school_expenses, :integer            
    add_column :courses, :academic_expenses, :integer         
    add_column :courses, :center_expenses, :integer   
    add_column :courses, :college_expenses, :integer 
    add_column :courses, :department_expenses, :integer          
      
    add_column :courses, :school_venue_fee, :integer 
    add_column :courses, :units_venue_fee, :integer      
    add_column :courses, :venue_fee_note, :text       
      
    add_column :courses, :personnel_fee, :integer
    add_column :courses, :sales_fee, :integer
    add_column :courses, :travel_fee, :integer
    add_column :courses, :facilities_fee, :integer
    add_column :courses, :hourly_fee, :integer
 
    add_column :courses, :no_of_users, :integer     
    add_column :courses, :no_of_finished_users, :integer
    add_column :courses, :total_credits, :integer
    add_column :courses, :total_hours, :integer      
    
    add_column :courses, :in_school_lecturers_quantity, :integer    
    add_column :courses, :out_school_lecturers_quantity, :integer 
    add_column :courses, :in_school_lecturers_hours, :integer   
    add_column :courses, :out_school_lecturers_hours, :integer    
       
  end
end
