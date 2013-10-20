class PostsController < ApplicationController
	before_action :set_post, only: [:show_lastname, :edit, :update, :destroy]

  def index #mapped as a GET request to the index.html.erb file
    @posts = Post.order('publish_date DESC')
    @categories = Category.all
    @posts = @posts.by_category_id(params[:category]) if params[:category].present?
  end

  def new
  	@post = Post.new
  	@post.categories.build
  end

  def show
     @post = Post.find_by_slug(params[:slug])
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

        format.html { redirect_to posts_path, notice: 'Runner was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    params[:post][:category_ids] ||= []
    respond_to do |format|
      if @post.update(post_params) 
        format.html { redirect_to posts_path, notice: 'post was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json { head :no_content }
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
