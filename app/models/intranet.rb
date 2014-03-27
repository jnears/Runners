class Intranet < ActiveRecord::Base

	attr_writer :start_time_text #set to an @instance variable (@start_time_text)

	validates_presence_of :start_time_text
	validate :check_start_time_text
	before_save :save_start_time_text

def start_time_text
	@start_time_text || start_time.try(:strftime, "%Y-%m-%d %H:%M:%S")
end


def save_start_time_text
	self.start_time = Time.zone.parse(@start_time_text) if @start_time_text.present?
end

def check_start_time_text
	if @start_time_text.present? && Time.zone.parse(@start_time_text).nil?
		errors.add :start_time_text, "Cannot accept date"
	end
	rescue ArgumentError
	errors.add :start_time_text, "Argument error"
end

end
