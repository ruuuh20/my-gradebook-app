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


  def letter_grade
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
      "Error?"

    end
  end

end
