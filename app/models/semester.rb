class Semester < ApplicationRecord
  has_many :courses

  validates :name, :presence => true
  validates :name, :uniqueness => true


# number of students per semester
  def total_students
  students_array = []
    self.courses.each do |c|
      students_array << c.users.student
    end

    students_array = students_array.uniq { |p| p.ids }
    students_array.first
    #from google:
#       Looks like @chapter is not a single Chapter object. If @chapter is initialized something like this:
#
#       @chapter = Chapter.where(:id => params[:id])
#       then you get a Relation object (that can be treated as a collection, but not a single object). So to fix this         you need to retrieve a record using find_by_id, or take a first one from the collection
#
#         @chapter = Chapter.where(:id => params[:id]).first

  end
end
