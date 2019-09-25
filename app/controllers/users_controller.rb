class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find_by(params[:id])
    @images = @user.images.order(created_at: :desc)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Photo uploaded'
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end
    
  private
      
  def user_params
    params.permit(:username, :email, :password, :avatar)
  end
end