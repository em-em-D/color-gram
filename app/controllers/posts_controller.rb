# frozen_string_literal: true

# :nodoc:
class PostsController < ApplicationController
  before_action :authenticate_user!
<<<<<<< HEAD
  before_action :sign_post, expect: %i[new index]
=======
  # before_action :sign_post, expect: %i[new index]
>>>>>>> milestone4

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

<<<<<<< HEAD
  def show; end

  def create
    @post = current_user.post.build(permit_post)
=======
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @comment.post_id = @post.id
  end

  def create
    @post = current_user.posts.build(permit_post)
>>>>>>> milestone4
    if @post.save
      flash[:success] = 'The Post you created was a Success!'
      redirect_to posts_path
    else
      flash.now[:error] = 'You have to write something to  publish'
<<<<<<< HEAD
      redirect_to new_post_path
=======
      render :new
>>>>>>> milestone4
    end
  end

  private

  def permit_post
    params.require(:post).permit(:description)
  end

<<<<<<< HEAD
  def sign_post
    @post = Post.find_by(params[:id])
  end
=======
  def sign_post; end
>>>>>>> milestone4
end
