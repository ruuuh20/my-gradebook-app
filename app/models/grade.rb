class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :assignment, optional: true
  #4.1.2.11 :optional
# If you set the :optional option to true, then the presence of the associated object won't be validated. By default, this option is set to false.

  #
  # def self.highest_score
  #   Grade.all.each do |grade|
  #     if
  
  def student_grades
    current_user.grades.all.map { |m| m.score }
  end
end
