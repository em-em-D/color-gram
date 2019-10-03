# frozen_string_literal: true

# :nodoc:
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true
  default_scope { order(created_at: :desc) }
end
