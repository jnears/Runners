class SlidersController < ApplicationController
  before_action :set_slider, only: :show 

  # def index #mapped as a GET request to the index.html.erb file
  #   @sliders = Slider.all
  #   @slides = Slide.all
  #   @sliders = @sliders.by_slide_id(params[:slide]) if params[:slide].present?
  # end

   def show
    @slider = Slider.find(params[:id]) 
   end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider
      @slider = Slider.find(params[:id]) #find is a method of activecontroller 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_params
        params.require(:slider).permit(:id, :title, slides_attributes: [:id, :description, :image, :image_slide, :slide_image_file_name, :_destroy ] )
    end

end
