# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  has_many :posts
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :confirmed_friendships, -> { where(confirmed: true) }, class_name: 'Friendship', foreign_key: :user_id,
                                                                  dependent: :destroy
  has_many :inverse_friendships, -> { where(confirmed: true) }, class_name: 'Friendship', foreign_key: :friend_id,
                                                                dependent: :destroy
  has_many :confirmed_friends, through: :confirmed_friendships, source: :friend
  has_many :confirmed_inverse_friends, through: :inverse_friendships, source: :user
  has_many :pending_friendships, -> { where(confirmed: nil) }, class_name: 'Friendship', foreign_key: :user_id,
                                                               dependent: :destroy
  has_many :pending_inverse_friendships, -> { where(confirmed: nil) }, class_name: 'Friendship',
                                                                       foreign_key: :friend_id,
                                                                       dependent: :destroy
  has_many :confirmed_friends_posts, through: :confirmed_friends, source: :posts
  has_many :conirmed_inverse_friends_posts, through: :confirmed_inverse_friends, source: :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  validates :email, presence: true
  validates :password, presence: true
  has_many :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  def friends
    confirmed_friends + confirmed_inverse_friends
  end

  def friend_requests
    pending_inverse_friendships.map(&:user)
  end

  def friend(user)
    friends.include?(user)
  end

  def pending_friends
    pending_friendships.map(&:friend)
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

  def timeline_posts
    confirmed_friends_posts + conirmed_inverse_friends_posts + posts
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.username
    end
  end
end
