class CommentsController < ApplicationController
  def create
		@post = Post.find(params[:post_id])
    create_params = post_params
    create_params[:user_id] = @post.user_id
		@comment = @post.comments.create(create_params)

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end

  private
  def post_params
    params[:comment].permit(:body)
  end
end
