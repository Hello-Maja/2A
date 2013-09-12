require 'bcrypt'
class User < ActiveRecord::Base
	include BCrypt
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates_format_of :email, :with => /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{1,4})+$/



    def password
      @password ||= Password.new(password_digest)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.password_digest = @password
    end
  # has_many :events, through: :event_attendances
  # has_many :attended_events, ->(user) { where user_id: user.id}, class_name: 'Event Attendance'
  # has_many :created_events, ->(user) { where user_id: user.id }, class_name: 'Event'
end

