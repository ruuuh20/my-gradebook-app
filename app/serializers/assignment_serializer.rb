class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :date, :status
  belongs_to :user
  belongs_to :course
  has_many :grades

end
