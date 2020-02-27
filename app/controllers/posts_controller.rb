class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@categorys = Category.all
	
	end

	def create
		@post =  Post.create(post_params)
		if @post.save
			redirect_to posts_path, :notice => "Your post has been saved"
		else
			render "new"
		end
	
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to post_path, :notice => "Your post has been updated"
		else
			render "edit"
		end
	end

	def show
		@post = Post.find(params[:id])
	end
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been deleted"	
	end

	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

   def post_params
      params.require(:post).permit(:title, :body, :category_id)
    end
	
end