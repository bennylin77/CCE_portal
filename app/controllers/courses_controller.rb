class CoursesController < ApplicationController
  before_action :authorize  
  before_action :set_course, only: [:show, :edit, :update, :destroy, :signsheet]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
    @course.cce_class_id = params[:cce_class_id]
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:title]='經費處理表' 
      flash[:notice]='成功建立經費處理表'
      redirect_to controller: :cce_classes, action: :indexManagement
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        flash[:title]='經費處理表'
        flash[:notice]='編輯成功'
        format.html { redirect_to @course}
      else
        format.html { render :edit }
      end
    end
  end

  def signsheet
  end

  def destroy
    @course.destroy
    respond_to do |format|
      flash[:title]='經費處理表'
      flash[:notice]='成功刪除'      
      format.html { redirect_to controller: :cce_classes, action: :indexManagement}
      format.json { head :no_content }
    end
  end

  private
  
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:cce_class_id, :title, :note, :code, :grants, :total_tuition, :other_funds,
      :school_expenses, :academic_expenses, :center_expenses, :college_expenses, :department_expenses, 
      :school_venue_fee, :units_venue_fee, :venue_fee_note, :personnel_fee, :sales_fee, :travel_fee, :facilities_fee, :hourly_fee,
      :no_of_users, :no_of_finished_users, :total_credits, :total_hours,
      :in_school_lecturers_quantity, :out_school_lecturers_quantity, :in_school_lecturers_hours, :out_school_lecturers_hours, :accounting_year)
    end
end