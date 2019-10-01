# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  has_many :post
  has_many :likes, dependent: :destroy
  has_many :comment
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  has_many :images
  has_one_attached :avatar
end
