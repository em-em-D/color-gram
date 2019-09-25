class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(params[:id])
  end

  def create
    @post = current_user.post.build(permit_post)
    if @post.save
      flash[:success] = 'The Post you created was a Success!'
      redirect_to posts_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path
    end
  end

  private
  
  def permit_post
    params.require(:post).permit(:description)
  end
    
end
