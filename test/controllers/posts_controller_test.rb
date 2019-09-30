# frozen_string_literal: true

require 'test_helper'
# :nodoc:
class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get posts_new_url
    assert_response :success
  end

  test 'should get index' do
    get posts_index_url
    assert_response :success
  end

  test 'should get show' do
    get posts_show_url
    assert_response :success
  end
end
