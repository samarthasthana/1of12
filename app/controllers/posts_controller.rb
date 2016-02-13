class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @posts = Post.all.order('created_at DESC')
    @posts = Post.page(params[:page]).per(3).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy!
      redirect_to root_path
    else
      render 'show'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
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
