# frozen_string_literal: true

# :nodoc:
class Comment < ApplicationRecord
  belongs_to :post
  has_many :user
  validates :body, presence: true
  default_scope { order(created_at: :desc) }
end
