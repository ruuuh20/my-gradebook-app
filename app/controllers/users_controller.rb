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
end
