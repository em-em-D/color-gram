# frozen_string_literal: true

# :nodoc:
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  default_scope { order(created_at: :desc) }
  validates :description, presence: true
  has_many :comments, dependent: :destroy
end
