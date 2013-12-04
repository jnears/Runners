class Slider < ActiveRecord::Base
  has_many :slides, :dependent => :destroy
  accepts_nested_attributes_for :slides, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
end
