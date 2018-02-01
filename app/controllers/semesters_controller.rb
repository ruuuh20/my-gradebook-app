class SemestersController < ApplicationController

  before_action :authenticate_user!
  before_action :must_be_admin, :except => [:index, :show]

  # @SEMESTER_LIST = ['Fall, Spring, Summer']

  def index
    @semesters = Semester.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @semesters}
    end
    # render json: @semesters

  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.create(semester_params)
    if @semester.save
      flash[:notice] = "successfully created"
      redirect_to semesters_path
    else
      flash[:error] = "There was an error"
      render 'semesters/new'
    end
  end

  def show
    @semester = Semester.find(params[:id])
    @semesters = Semester.all
    @this_semester_students = @semester.total_students
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @semester}
    end

  end

  def edit
    @semester = Semester.find(params[:id])
  end

  def update
    @semester = Semester.find(params[:id])
    if @semester.update(semester_params)
      @semester.save
      flash[:notice] = "Semester has been updated"
      redirect_to semester_path(@semester)
    else
      flash[:error] = "There was an error"
      render "semesters/edit"
    end
  end


  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy
    # flash[:success] = "Deleted"
    redirect_to semesters_path, :alert => "Deleted"
  end


  private
    def semester_params
      params.require(:semester).permit(:name)
    end
end
