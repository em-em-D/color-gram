# frozen_string_literal: true

# :nodoc:
class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :image
end
