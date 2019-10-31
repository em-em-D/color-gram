# frozen_string_literal: true

# :nodoc:
class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friends = Friends.all
  end

  def show
    @friendships = requests
    redirect_to root_path if @friendships.empty?
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:id])
    if @friendship.save
      flash[:success] = 'Your friend request was sent successfully '
    else
      flash[:alert] = ' Sorry there was an error'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @friend1 = Friendship.where(user_id: params[:format], friend_id: current_user.id)
    @friend2 = Friendship.where(user_id: current_user.id, friend_id: params[:format])
    @friend = @friend1.empty? ? @friend2 : @friend1
    flash[:danger] = 'You are no longer friends' if @friend.delete_all
    redirect_back(fallback_location: root_path)
  end

  def confirm
    @user = User.find_by(id: params[:format])
    friendship = Friendship.where(user: @user, friend: current_user)
    friendship.update(confirmed: true)
    flash[:success] = 'You are now friends'
    redirect_to users_path
  end

  def reject
    @user = User.find_by(id: params[:format])
    current_user.reject_friends(@user)
    flash[:success] = 'You rejected the friend request'
    redirect_back(fallback_location: root_path)
  end

  def cancel
    @user = User.find_by(id: params[:format])
    current_user.friendships.find_by(friend_id: params[:id]).destroy
    flash[:success] = 'Your friend request is cancelled'
    redirect_back(fallback_location: root_path)
  end
end
