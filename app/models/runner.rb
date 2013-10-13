class Runner < ActiveRecord::Base

has_and_belongs_to_many :shoes
accepts_nested_attributes_for :shoes

	validates :firstname, presence: true
  
  include Name #testing concerns

end
