class Course < ApplicationRecord
  belongs_to :semester
  has_many :registrations
  has_many :users, through: :registrations
  has_many :assignments

  validates :name, :presence => true
  validates :code, :numericality => { only_integer: true }
  validates :code, :length => { maximum: 3 }


  def self.most_students
    joins(:registrations).group(:course_id).order("count(*) DESC")
  end



end
