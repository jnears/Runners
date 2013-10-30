class PostsController < ApplicationController

def index #mapped as a GET request to the index.html.erb file
    @posts = Post.order('publish_date DESC')
    @categories = Category.all
    @posts = @posts.by_category_id(params[:category]) if params[:category].present?
  end


  def show
     @post = Post.find_by_slug(params[:slug])
  end

  


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
        params.require(:post).permit(:id, :title, :excerpt, :body, :slug, :publish_date, :category_ids => [], categories_attributes: [:id, :name] )
    end
end
