class CoursesController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_only, :except => [:index, :show]

  def index
    @semester = Semester.find(:id)
    @courses = @semester.courses.all
    @all_courses = Course.all
  end

end
