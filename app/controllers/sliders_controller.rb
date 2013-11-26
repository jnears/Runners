class SlidersController < ApplicationController
	def index
		@images = Dir.glob("app/assets/images/slider/*.jpg")
	end
end
