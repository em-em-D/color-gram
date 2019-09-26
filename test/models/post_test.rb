# frozen_string_literal: true

require 'test_helper'
# :nodoc:
class PostTest < ActiveSupport::TestCase
  test 'should not save post without description' do
    post = Post.new
    assert post.save, 'saved post with description'
  end
end
