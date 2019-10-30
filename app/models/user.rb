# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  has_many :posts
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :inverse_friendships, -> { where(confirmed: true) }, class_name: 'Friendship', foreign_key: :friend_id,
                                                                dependent: :destroy
  has_many :confirmed_friendships, -> { where(confirmed: true) }, class_name: 'Friendship', foreign_key: :user_id,
                                                                  dependent: :destroy
  has_many :confirmed_friends, through: :confirmed_friendships, source: :friend
  has_many :confirmed_inverse_friends, through: :inverse_friendships, source: :user
  has_many :pending_friendships, -> { where(confirmed: nil) }, class_name: 'Friendship', foreign_key: :user_id,
                                                               dependent: :destroy
  has_many :pending_inverse_friendships, -> { where(confirmed: nil) }, class_name: 'Friendship',
                                                                       foreign_key: :friend_id,
                                                                       dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  has_many :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  def friends
    confirmed_friends + confirmed_inverse_friends
  end

  def pending_friends
    pending_friendships.map(&:friend)
  end

  def friend_requests

    pending_inverse_friendships.map(&:user)
  end

  def friend(user)
    friends.include?(user)
  end

  def sent_request?(user)
    pending_friends.include?(user)
  end

  def reject_friend(user)
    friendship = pending_inverse_friendships.find { |f| f.user == user }
    friendship.destroy
  end

  def mutual_friends(user)
    friends & user.friends unless user.id == id
  end
end
