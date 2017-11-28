class RegistrationsController < ApplicationController

  #for admin to create user?
  def new
    @user = User.new
    @user.courses.build
    render 'registrations/new'
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:alert] = "User created."
      redirect_to @user
    else
      flash[:error] = "There was an error"
      render 'registrations/new'
   end
 end

 private
   def user_params
     params.require(:user).permit(:email, :password, :role, course_ids:[], courses_attributes: [:name])
   end


end
