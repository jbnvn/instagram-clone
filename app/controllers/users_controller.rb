class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:index, :show]
  before_action :set_post, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user_posts = @user.posts
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
