# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    @images = @user.images.order(created_at: :desc)
  end
end
