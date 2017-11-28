require 'pry'
class UsersController < ApplicationController

  before_action :authenticate_user!


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:notice] = 'Access denied'
      redirect_to root_path
    end

  end

  #for admin to create user?
  def new
    @user = User.new
    @user.courses.build
    render 'registrations/new'
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def dashboard
  @semesters = Semester.all
    if current_user.student?
      @courses = current_user.courses
    elsif current_user.admin?
      @users = User.all
      @courses = Course.all
    end



  end

  def enrollments
    # binding.pry
    @registrations = Registration.all

    render 'registrations/index'
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, course_ids:[])
    end
end
