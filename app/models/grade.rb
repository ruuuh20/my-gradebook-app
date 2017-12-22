class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :assignment, optional: true
  # validates :score, numericality: true, inclusion: { :in => 1..200}, :message => "can only be between 1 and 200."
  validates_numericality_of :score, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 200, :message => "must be between 0 and 200"

  #4.1.2.11 :optional
# If you set the :optional option to true, then the presence of the associated object won't be validated. By default, this option is set to false.

  #
  # def self.highest_score
  #   Grade.all.each do |grade|
  #     if

  def student_grades
    current_user.grades.all.map { |m| m.score }
  end

  def self.average_1
      Grade.where(:assignment_id => 1).average(:score).to_i
  end

  def self.average_2
      Grade.where(:assignment_id => 2).average(:score).to_i
  end

  def self.average_3
      Grade.where(:assignment_id => 3).average(:score).to_i
  end

  def self.average_4
      Grade.where(:assignment_id => 4).average(:score).to_i
  end

  def self.average_5
      Grade.where(:assignment_id => 5).average(:score).to_i
  end

  def self.average_6
      Grade.where(:assignment_id => 6).average(:score).to_i
  end



  def self.average_by_class
    # add association?
    # joins(:course).group(:course_id).order("count(*) DESC")
    grades_total = []
    @courses = Course.all
    @courses.each do |course|
      course.assignments.each do |assignment|
         grades_total << assignment.grades.all.map { |m| m.score }
      end
    end
    return grades_total
  end

  def self.blah
    Grade.all.group_by(&:assignment_id)
  end



  def to_letter_grade
    if (self.score >= 90 && self.score <= 200)
      "A"
    elsif (self.score >= 80 && self.score <= 89)
      "B"
    elsif (self.score >= 70 && self.score <= 79)
      "C"
    elsif (self.score >= 60 && self.score <= 69)
      "D"
    elsif (self.score >= 0 && self.score <= 59)
      "F"
    else
      "No letter grade found"
    end
  end

end
