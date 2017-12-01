require 'pry'
class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :must_be_admin, :except => :dashboard


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

#for admin
def new
  @user = User.new
  render 'registrations/new'
end

  def savenew
    @user = User.create_new_user(user_params)
    # binding.pry
    if @user.save
      flash[:alert] = "User created."
      redirect_to @user
    else
      flash[:error] = "There was an error"
      render 'registrations/new'
    end
  end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:notice] = "User updated"
    redirect_to users_path
  else
    flash[:error] = "There was an error"
    render 'users/edit'
  end
end


  def dashboard
  @semesters = Semester.all
    if current_user.student? || current_user.teacher?
      @courses = current_user.courses
    elsif current_user.admin?
      @users = User.all
      @courses = Course.all
    end
  end

  def enrollments
    # binding.pry
    @registrations = Registration.all
    @users = User.all
    @courses = Course.all
    # binding.pry
    render 'registrations/index'
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :role, course_ids:[], courses_attributes: [:name])
    end
end
