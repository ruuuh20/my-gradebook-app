class CoursesController < ApplicationController

  before_action :authenticate_user!
  before_action :must_be_admin, :except => [:index, :show]

  def index
    @semester = Semester.find(params[:semester_id])
    @courses = @semester.courses.all
    @all_courses = Course.all

    # render :layout => false
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @courses}
    end

  end

  #for admin to see all courses ?????
  def all_index
    
    @all_courses = Course.all
  end

  def new
    @semester = Semester.find(params[:semester_id])
    @course = @semester.courses.build
  end


  def create
    @course = Course.new(course_params)
    @semester = Semester.find(params[:semester_id])
    @course.semester_id = @semester.id
    if @course.save
      flash[:notice] = "Course created"
      redirect_to semester_course_path(@semester.id, @course.id)
    else
      flash[:error] = "There was an error"
      redirect_to root_path
    end
  end

  def show
    @course = Course.find(params[:id])
    @semester =  Semester.find(params[:semester_id])

    @assignments = @course.assignments
    @assignment = @course.assignments.build

    respond_to do |format|
      format.html {render :show}
      format.json {render json: @course}
    end
  end

  def edit
    @course = Course.find(params[:id])
    @semester = Semester.find(params[:semester_id])
  end

  def update
    @course = Course.find(params[:id])
    @semester = Semester.find(params[:semester_id])
    if @course.update(course_params)
      @course.save
      flash[:notice] = "Course Updated"
      redirect_to semester_course_path(@semester.id, @course.id)
    else
      flash[:error] = "There was an error"
      render "courses/new"
    end
  end



  def destroy
    @semester = Semester.find(params[:semester_id])
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Successfully deleted"
    redirect_to semester_courses_path(@semester)
  end

  def most_students
    @courses = Course.most_students
  end

  private
    def course_params
      params.require(:course).permit(:name, :code, :semester_id)
    end

end
