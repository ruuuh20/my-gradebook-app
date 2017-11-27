class SemestersController < ApplicationController

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
end
