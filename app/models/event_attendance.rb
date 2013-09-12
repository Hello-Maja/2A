class EventAttendance < ActiveRecord::Base
	has_many :users
end
