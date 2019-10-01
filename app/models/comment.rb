# frozen_string_literal: true

# :nodoc:
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to_many :users
  default_scope { order(created_at: :desc) }
end
