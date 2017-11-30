class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :must_be_admin_or_teacher, :except => [:index, :show]


  def index

    if current_user.admin?
      @all_assignments = Assignment.all
    end
    # everyone
    @semester = Semester.find(params[:semester_id])
    @course = Course.find(params[:course_id])
    @assignments = @course.assignments
  end

  def new
    @semester = Semester.find(params[:semester_id])
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new

  end

  def create
    @semester = Semester.find(params[:semester_id])
    @course = Course.find(params[:course_id])
    # @course = Course.find(params[:id])
    @assignment = Assignment.create(assignment_params)
    @assignment.course_id = @course.id
    if @assignment.save
      flash[:notice] = "Assignment was created."
      redirect_to @course
    else
      flash[:error] = "There was an error"
      render 'assignments/new'
    end
  end


  end

private
  def assignment_params
    params.require(:assignment).permit(:name, :description, :date, :status, :user_id)
  end


end
