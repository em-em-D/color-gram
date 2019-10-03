# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true
                    format: { with: VALID_EMAIL_REGEX }
  has_many :images
  has_one_attached :avatar
end
