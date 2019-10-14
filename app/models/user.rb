# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  has_many :post
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  has_many :images
  has_one_attached :avatar

  def friends
    friends_array = friendships.map { |friendship| friendship.friend unless friendship.confirmed }
    friends_array && inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }
    friends_array.compact
  end

  # Users who have yet to confirm a friend request
  def pending_friends
    friendships.map { |friendship| friendship.friend unless !friendship.confirmed }.compact
  end

  # users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless !friendship.confirmed }.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find { |friends| friends.user == user }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end
end
