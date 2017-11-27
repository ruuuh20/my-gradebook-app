class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  enum :role => [:admin, :student, :guardian, :teacher]

  #hook
  # after_initialize is used instead of overriding activerecord's initialize
  after_initialize :set_default_role
  has_many :registrations
  has_many :courses, through: :registrations

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
