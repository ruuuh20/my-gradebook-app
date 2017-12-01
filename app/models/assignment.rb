class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def self.overdue

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
