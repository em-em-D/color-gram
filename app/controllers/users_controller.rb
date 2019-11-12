# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where('id != ?', current_user.id)
    @friendship = current_user.friendships.build
  end

  def show
    @user = User.find(params[:id])
    @user_post = @user.posts
    @images = @user.images.order(created_at: :desc)
    @friendship = current_user.friendships.build
  end
end
