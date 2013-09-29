class Shoe < ActiveRecord::Base
	has_and_belongs_to_many :runners
	# accepts_nested_attributes_for :runners
end
