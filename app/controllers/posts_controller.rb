class PostsController < ApplicationController
	before_action :set_post, only: [:show_lastname, :show, :edit, :update, :destroy]

  def index #mapped as a GET request to the index.html.erb file
    @posts = Post.all 
  end

  def new
  	@post = Post.new
  	@post.categories.build
  end

  def show
  end

  def edit
  	if @post.categories.empty? #if no associated record exists ensure a form field shows by calling the build method
    @post.categories.build #build method returns a new object of the associated type ready to be filled and saved
     end
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save                    

        format.html { redirect_to @post, notice: 'Runner was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    params[:post][:category_ids] ||= []
    respond_to do |format|
      if @post.update(post_params) 
        format.html { redirect_to @post, notice: 'post was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id]) #find is a method of activecontroller 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
        params.require(:post).permit(:id, :title, :excerpt, :body, :slug, :publish_date, :category_ids => [], categories_attributes: [:id, :name] )
    end
end
