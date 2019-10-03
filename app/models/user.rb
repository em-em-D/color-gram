# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  has_many :post
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true
  validates :password, presence: true,
                       format: { with: VALID_EMAIL_REGEX }
  has_many :images
  has_one_attached :avatar
end
