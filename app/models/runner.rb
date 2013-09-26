class Runner < ActiveRecord::Base

	validates :firstname, presence: true
  
  include Name

end
