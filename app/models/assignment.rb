class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :grades

  total = 0

  def total_scores

    self.grades.each do |g|
      total += g.score
    end
    total
  end

  def self.chronological
    Assignment.order(:date)
  end

  def self.completed
    where(status: 'completed')
  end

  def self.not_completed
    where(status: 'not completed')
  end


end
