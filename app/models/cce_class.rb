class CceClass < ActiveRecord::Base
  belongs_to :user  
  has_many :news, dependent: :destroy  
  has_many :courses, dependent: :destroy
  has_many :cce_class_dimensions, dependent: :destroy
  has_many :dimensions, through: :cce_class_dimensions
  accepts_nested_attributes_for :cce_class_dimensions
  
  validates :title, presence: {message: "課程名稱 不能是空白"}
  validates :kind, presence: {message: "課程類別 不能是空白"}
  validates :status, presence: {message: "課程狀態 不能是空白"}
  validates :school_year, presence: {message: "課程學年 不能是空白"}
  validates :start_at, presence: {message: "課程開始日 不能是空白"}    
  validates :end_at, presence: {message: "課程結束日 不能是空白"}    
  validates :total_hours, presence: {message: "課程總時數 不能是空白"}   
  validates :class_time, presence: {message: "上課時間 不能是空白"}    
  validates :location, presence: {message: "上課地點 不能是空白"}  
  validates :introduction, presence: {message: "課程介紹 不能是空白"}  
  validates :user_size_limits, presence: {message: "招生人數 不能是空白"}  
  validates :in_school_lecturers_quantity, presence: {message: "校內師資人數 不能是空白"}  
  validates :out_school_lecturers_quantity, presence: {message: "校外師資人數 不能是空白"}          
  validates :organizer, presence: {message: "主辦單位 不能是空白"}          
  validates :host, presence: {message: "主持人 不能是空白"}   
  validates :host_extend, presence: {message: "主持人學校分機 不能是空白"}     
  validates :tuition, presence: {message: "學費 不能是空白"}
  
  validates :grants, presence: {message: "預計經費來源-補助款 不能是空白或請填0"}
  validates :total_tuition, presence: {message: "預計經費來源-總共學費 不能是空白或請填0"}
  validates :other_funds, presence: {message: "預計經費來源-其他經費來源 不能是空白或請填0"}
  
  validates :school_expenses, presence: {message: "預計經費支出-學校 不能是空白或請填0"}
  validates :academic_expenses, presence: {message: "預計經費支出-教務處 不能是空白或請填0"}
  validates :center_expenses, presence: {message: "預計經費支出-各中心 不能是空白或請填0"}
  validates :college_expenses, presence: {message: "預計經費支出-各學院 不能是空白或請填0"}
  validates :department_expenses, presence: {message: "預計經費支出-各系所 不能是空白或請填0"}
  validates :school_venue_fee, presence: {message: "預計經費支出-學校場地費 不能是空白或請填0"}
  validates :units_venue_fee, presence: {message: "預計經費支出-各單位場地費 不能是空白或請填0"}
  
  validates :personnel_fee, presence: {message: "預計經費支出-人事費 不能是空白或請填0"}              
  validates :sales_fee, presence: {message: "預計經費支出-業務費 不能是空白或請填0"}              
  validates :travel_fee, presence: {message: "預計經費支出-差旅費 不能是空白或請填0"}              
  validates :facilities_fee, presence: {message: "預計經費支出-設備費 不能是空白或請填0"}              
  validates :hourly_fee, presence: {message: "預計經費支出-鐘點費 不能是空白或請填0"}    


  validate  :kindIsCreditMostWithTotalCredits
  
  has_attached_file :attachment,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"       
  validates_attachment :attachment, size: { less_than: 1024.megabytes, message: "課程附件大小超過1T" },
                                    file_name: {matches: [/png\Z/, /jpe?g\Z/, /gif\Z/, 
                                                          /zip\Z/, /rar\Z/, /pdf\Z/, /txt\Z/,
                                                          /xlsx\Z/, /xls\Z/, /ppt\Z/, /pptx\Z/, /doc\Z/, /dox\Z/
                                                          ], message: "課程附件不接受此檔案類型" }  
  
  def kindIsCreditMostWithTotalCredits
    if total_credits.blank? and kind==GLOBAL_VAR['kind_credit'] 
      errors.add(:total_credits, "請填寫總學分")
    end
  end       
  
end
