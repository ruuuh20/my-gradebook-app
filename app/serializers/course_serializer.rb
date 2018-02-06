class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :code

  belongs_to :semester
  has_many :registrations
  has_many :users, through: :registrations
  has_many :assignments
  # has_many :grades
end
