class Course < ActiveRecord::Base
  belongs_to :cce_class
  
  validates :title, presence: {message: "課程名稱 不能是空白"}  
  validates :accounting_year, presence: {message: "會計年度 不能是空白"}  


  validates :grants, presence: {message: " 補助款 不能是空白或請填0"}
  validates :total_tuition, presence: {message: "總共學費 不能是空白或請填0"}
  validates :other_funds, presence: {message: " 其他經費來源 不能是空白或請填0"}
  
  validates :school_expenses, presence: {message: "經費支出-學校 不能是空白或請填0"}
  validates :academic_expenses, presence: {message: "經費支出-教務處 不能是空白或請填0"}
  validates :center_expenses, presence: {message: "經費支出-各中心 不能是空白或請填0"}
  validates :college_expenses, presence: {message: "經費支出-各學院 不能是空白或請填0"}
  validates :department_expenses, presence: {message: "經費支出-各系所 不能是空白或請填0"}
  validates :school_venue_fee, presence: {message: "經費支出-學校場地費 不能是空白或請填0"}
  validates :units_venue_fee, presence: {message: "經費支出-各單位場地費 不能是空白或請填0"}
  
  validates :personnel_fee, presence: {message: "經費支出-人事費 不能是空白或請填0"}              
  validates :sales_fee, presence: {message: "經費支出-業務費 不能是空白或請填0"}              
  validates :travel_fee, presence: {message: "經費支出-差旅費 不能是空白或請填0"}              
  validates :facilities_fee, presence: {message: "經費支出-設備費 不能是空白或請填0"}              
  validates :hourly_fee, presence: {message: "經費支出-鐘點費 不能是空白或請填0"}              

  validates :no_of_users, presence: {message: "實際培訓人次 不能是空白"}              
  validates :no_of_finished_users, presence: {message: "實際上課(結業)人次 不能是空白"}              
        

  validates :in_school_lecturers_quantity, presence: {message: "校內師資人數 不能是空白"}              
  validates :out_school_lecturers_quantity, presence: {message: " 校外師資人數 不能是空白"}              
  validates :in_school_lecturers_hours, presence: {message: "校內師資時數 不能是空白"}              
  validates :out_school_lecturers_hours, presence: {message: " 校外師資時數 不能是空白"}  


end
