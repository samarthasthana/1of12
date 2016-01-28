class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    create_params = post_params
    create_params[:user_id] = current_user.id
    @post = Post.new(create_params)

    if @post.save
			redirect_to root_url
		else
			render 'new'
		end
  end

  private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
