# frozen_string_literal: true

# :nodoc:
class Comment < ApplicationRecord
  belongs_to :post
  default_scope { order(created_at: :desc) }
end
