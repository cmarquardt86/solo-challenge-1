class Event < ActiveRecord::Base
	validates :organizer_name, presence: true
	validates :organizer_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates :title, presence: true, uniqueness: { case_sensitive: false }
	validate :non_past_dates
	validates :date, presence: true


	def non_past_dates
 		errors.add(:date, "can't be in the past") if !date.blank? and date < Date.today 
 	end
end