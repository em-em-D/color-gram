# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show; end
end
