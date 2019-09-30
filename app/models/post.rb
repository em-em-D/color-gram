# frozen_string_literal: true

# :nodoc:
class Post < ApplicationRecord
  belongs_to :user
  default_scope { order(created_at: :desc) }
  validates :description, presence: true
  has_many :comments
end
