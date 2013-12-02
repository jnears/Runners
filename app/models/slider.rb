class Slider < ActiveRecord::Base
  has_many :slides, :dependent => :destroy
  accepts_nested_attributes_for :slides
end
