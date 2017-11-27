class SemestersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_only, :except => [:index, :show]

  # @SEMESTER_LIST = ['Fall, Spring, Summer']

  def index
    @semesters = Semester.all


  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.create(semester_params)
    if @semester.save
      flash[:success] = "successfully created"
      redirect_to semesters_path
    else
      flash[:error] = "There was an error"
      redirect_to root_path
    end
  end

  def show
    @semester = Semester.find(params[:id])
  end

  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy
    flash[:success] = "Deleted"
    redirect_to semesters_path
  end


  private
    def semester_params
      params.require(:semester).permit(:name)
    end
end
