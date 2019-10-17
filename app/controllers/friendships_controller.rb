# frozen_string_literal: true

# :nodoc:
class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friend = User.find_by_id(params[:id])
    @friendship = current_user.friendships.build(friend_id: params[:id])
    redirect_back(fallback_location: root_path) if @friendship.save
  end

  def update
    user = User.find_by_id(params[:id])
    if current_user.confirm_friend(user)
      if requests.any?
        redirect_back(fallback_location: root_path)
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    if params[:id]
      user = User.find_by_id(params[:id])
    else
      @friendship = current_user.inverse_friendships.find_by_id(params[:friend_id])
    end
    @friendship ||= user.inverse_pending_friendships.find { |friendship| friendship.user = current_user }
    redirect_back(fallback_location: root_path) if @friendship.delete
  end

  def show
    @friendships = requests
  end
end