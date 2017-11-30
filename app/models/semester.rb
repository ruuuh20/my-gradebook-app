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

  end
end
