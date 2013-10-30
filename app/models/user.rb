class User < ActiveRecord::Base
	validates_presence_of :name, :email
	validates :email, format: {REGEX HERE}, uniqueness: { case_sensitive: false }
	before_save { self.email = email.downcase }
end
