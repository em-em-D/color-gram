# frozen_string_literal: true

# :nodoc:
class Comment < ApplicationRecord
  belongs_to :post
end
