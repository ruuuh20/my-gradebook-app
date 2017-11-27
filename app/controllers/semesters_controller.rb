class SemestersController < ApplicationController

  def index
    @semesters = Semester.all
    render :text => "Hi"
  end
end
