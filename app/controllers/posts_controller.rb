# frozen_string_literal: true

# :nodoc:
class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :sign_post, expect: %i[new index]

  def new; end

  def index; end

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
