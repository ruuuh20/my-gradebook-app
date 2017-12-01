require 'pry'
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
    @assignments_in_order = @assignments.chronological
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
    if current_user.teacher?
      @assignment.user_id = current_user.id
    end
    # binding.pry
    if @assignment.save
      flash[:notice] = "Assignment was created."
      redirect_to  semester_course_assignments_path(@semester, @course, @assignment)
    else
      flash[:error] = "There was an error"
      render 'assignments/new'
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    @semester = Semester.find(params[:semester_id])
    @course = Course.find(params[:course_id])
  end

  def edit
    @semester = Semester.find(params[:semester_id])
    @course = Course.find(params[:course_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    @semester = Semester.find(params[:semester_id])
    @course = Course.find(params[:course_id])
    @assignment = Assignment.update(assignment_params)
      if @assignment.save
        flash[:notice] = "Assignment was updated."
        redirect_to semester_course_assignments_path(@semester, @course, @assignment)
      else
        flash[:error] = "There was an error."
        render 'assignments/edit'
      end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    flash[:notice] = "Deleted"
    redirect_to semester_course_assignments_path(@semester, @course, @assignment)
  end





private
  def assignment_params
    params.require(:assignment).permit(:name, :description, :date, :status, :user_id)
  end


end
