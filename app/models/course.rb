class Course < ApplicationRecord
  belongs_to :semester
  has_many :registrations
  has_many :users, through: :registrations
  has_many :assignments
end
