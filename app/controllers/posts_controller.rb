class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all

    # @user = User.find(params[:id])
    # @user_posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      # flash[:success] = "Your post has been created !"
      redirect_to post_path(@post)
    else
      # flash[:alert] = @post.errors.full_messages
      render :new
      # redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :photo)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
