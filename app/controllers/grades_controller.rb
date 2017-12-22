require 'pry'
class GradesController < ApplicationController

  before_action :authenticate_user!
  before_action :must_be_admin_or_teacher

  def index
    if current_user.admin?
      @grades = Grade.all
      @grades_hash = Grade.blah
      @assignments = []
      @grades_hash.each do |key, value|
        @assignments << Assignment.find_by_id(key)

      end
    else
      @grades = current_user.grades.all
    end
  end




  def new
    @grade = Grade.new
  end


  def create
    @user = User.find(params["grade"][:user_id])
    @assignment = Assignment.find(params["grade"]["assignment_id"])

      if !@user.user_assignments_total.include?(@assignment)
        flash[:error] = "Student and Assignment do not match"
        redirect_to new_grade_path
      else
    # else
        @grade = Grade.create(grade_params)

      # @student = User.find(params["grade"][:user_id])
      # @grade = @student.grades.build
      # @assignment = Assignment.find(params["grade"]["assignment_id"])
    # @user = User.find
    # if the inputted user_id is not a student
    # binding.pry
          if @grade.save
            @grade.assignment_id = params["grade"]["assignment_id"]
            @grade.user_id = params["grade"][:user_id]
            flash[:notice] = "Grade was added succesfully."
            redirect_to grades_path
          else
            # binding.pry
            flash[:error] = "There was an error"
            render 'grades/new'
          end
        end
    end



  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy
    flash[:alert] = "Grade was deleted"
    redirect_to grades_path
  end


  private
    def grade_params
      params.require(:grade).permit(:score, :assignment_id, :user_id)
    end
end
