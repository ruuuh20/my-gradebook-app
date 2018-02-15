class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :code, :semester_id

  belongs_to :semester
  has_many :registrations
  has_many :users, through: :registrations
  has_many :assignments
  # has_many :grades
end
