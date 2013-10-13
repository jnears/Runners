class CategoriesController < ApplicationController
	before_action :set_category, only: [:show_lastname, :show, :edit, :update, :destroy]

  def index #mapped as a GET request to the index.html.erb file
    @categories = Category.all 
  end

  def new
  	@category = Category.new
  	# @category.categories.build
  end

  def show
  end

  def edit
  	# if @category.categories.empty? #if no associated record exists ensure a form field shows by calling the build method
      # @category.categories.build #build method returns a new object of the associated type ready to be filled and saved
    # end
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save                    

        format.html { redirect_to @category, notice: 'Runner was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params) 
        format.html { redirect_to @category, notice: 'category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id]) #find is a method of activecontroller 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
        params.require(:category).permit(:id, :name)
    end
end
