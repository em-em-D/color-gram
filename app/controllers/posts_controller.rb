# frozen_string_literal: true

# :nodoc:
class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @comment.post_id = @post.id
  end

  def create
    @post = current_user.posts.build(permit_post)
    if @post.save
      flash[:success] = 'The Post you created was a Success!'
      redirect_to posts_path
    else
      flash.now[:error] = 'You have to write something to  publish'
      render :new
    end
  end

  private

  def permit_post
    params.require(:post).permit(:description)
  end

  def sign_post; end
end
