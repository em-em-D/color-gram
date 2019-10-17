# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images.order(created_at: :desc)
  end
end
