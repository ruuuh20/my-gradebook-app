class CoursesController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_only, :except => [:index, :show]

  def index
    @semester = Semester.find(params[:semester_id])
    @courses = @semester.courses.all
    @all_courses = Course.all
  end

  def new
    @semester = Semester.find(params[:id])
    @course = @semester.courses.build(course_params)
  end


  def create
    @course = Course.new(course_params)
    @semester = Semester.find(params[:id])
    @course.semester_id = @semester.id
    if @course.save
      flash[:success] = "Successfully created"
      redirect_to semester_course_path(@semester.id, @course.id)
    else
      flash[:error] = "error"
      redirect_to root_path
    end
  end


  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Deleted"
    redirect_to root_path
  end

end
