# frozen_string_literal: true

# :nodoc:
class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = 'You wanna like this twice!! you have done this before'
    else
      @post.likes.create(user_id: current_user.id)
      redirect_to posts_path
    end
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'no unlikes allowed on this platform'
    else
      @like.destroy
      redirect_to posts_path
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.find_by(user_id: current_user.id, post_id: params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
