class SlidersController < ApplicationController

def index #mapped as a GET request to the index.html.erb file
    @sliders = Slider.all
    @slides = Slide.all
    @sliders = @sliders.by_slide_id(params[:category]) if params[:category].present?
  end


  def show
     @slider = Slider.find_by_slug(params[:slug])
  end

  


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_params
        params.require(:slider).permit(:id, :title, :slide_ids => [], slides_attributes: [:id, :description, :image] )
    end
end
