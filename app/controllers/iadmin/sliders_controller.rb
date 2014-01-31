class Iadmin::SlidersController < ApplicationController
	before_action :set_slider, only: [:edit, :sortable, :update, :destroy]

  def index #mapped as a GET request to the index.html.erb file
    @sliders = Slider.all
    @slider = Slide.all
    @sliders = @sliders.by_slide_id(params[:slide]) if params[:slide].present?
  end

  # def show
  #    @slider = slider.find_by_slug(params[:slug])
  # end

  def new
  	@slider = Slider.new
    1.times do
      slide = @slider.slides.build
    end
  end

  def edit
  	if @slider.slides.empty? #if no associated record exists ensure a form field shows by calling the build method
    end
   
  end

  def create
    @slider = Slider.new(slider_params)

    respond_to do |format|
      if @slider.save                    

        format.html { redirect_to iadmin_sliders_path, notice: 'Slider was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    params[:slider][:slide_ids] ||= []
    respond_to do |format|
      if @slider.update(slider_params) 
        format.html { redirect_to iadmin_sliders_path, notice: 'Slider was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end


  def destroy
    @slider = Slider.find(params[:id])
    @slider.destroy

    respond_to do |format|
      format.html { redirect_to iadmin_sliders_path }
      format.json { head :no_content }
    end
  end

  def sortlist


    params[:slide].each_with_index do |id, index|
     Slide.update_all({sort: index+1}, {id: id})
  end
  render nothing: true
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider
      @slider = Slider.find(params[:id]) #find is a method of activecontroller 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_params
        params.require(:slider).permit(:id, :title, slides_attributes: [:id, :description, :image, :image_slide, :slide_image_file_name, :sorted, :_destroy ] )
    end

end
