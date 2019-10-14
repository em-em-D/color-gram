# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
<<<<<<< HEAD
=======
  before_action :authenticate_user!

>>>>>>> milestone4
  def index
    @user = User.all
  end

  def show
<<<<<<< HEAD
    @user = User.find_by(params[:id])
=======
    @user = User.find(params[:id])
>>>>>>> milestone4
    @images = @user.images.order(created_at: :desc)
  end
end
