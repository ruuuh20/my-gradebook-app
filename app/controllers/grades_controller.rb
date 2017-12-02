class GradesController < ApplicationController

  before_action :authenticate_user!
  before_action :must_be_admin_or_teacher

  def index
    if current_user.admin?
      @grades = Grade.all
    elsif current_user.student?
      @grades = current_user.grades.all
    end
  end


  end

  def new
    @grade = Grade.new
  end


  def create
    # if User.students_ids_only.include?(params["grade"][:user_id]) == false
    #     flash[:error] = "That is not a valid student id"
    #     render 'grades/new'
    # else
      @grade = Grade.create
      @student = User.find(params["grade"][:user_id])
      @grade = @student.grades.build
      @assignment = Assignment.find(params["grade"]["assignment_id"])
    # @user = User.find
    # if the inputted user_id is not a student
    # binding.pry


          if @grade.save!
            flash[:notice] = "Grade was added succesfully."
            redirect_to root_path
          else
            # binding.pry
            flash[:error] = "There was an error"
            render 'grades/new'
          end
        end
      # end


  private
    # def grade_params
    #   params.require(:grade).permit(:score, :assignment_id, :user_id)
    # end
end
