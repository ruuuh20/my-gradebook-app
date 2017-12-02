class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook]
            # :validatable,
  enum :role => [:admin, :student, :teacher]

  #hook
  # after_initialize is used instead of overriding activerecord's initialize
  after_initialize :set_default_role
  validates_format_of :email, :with => /@/

  has_many :registrations, :dependent => :destroy
  has_many :courses, through: :registrations
  has_many :assignments
  has_many :grades

  # for admin to create user
  def self.create_new_user(params)
    User.create!(params)

  end

  def courses_attributes=(course_attributes)
    course_attributes.values.each do |course_attribute|
      course = Course.find_or_create_by(course_attribute)
      # self.courses.build(course_attributes)
      self.courses << course unless course.name.empty?
    end
  end

  def self.students_ids_only
    User.student.map { |r| r.id }
  end

  def self.teachers_ids_only
    User.teacher.map { |r| r.id }
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
    end
  end

  def set_default_role
    self.role ||= :student
    # self.role = :student unless self.role
  end


end
