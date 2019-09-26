# frozen_string_literal: true

require 'test_helper'
# :nodoc:
class UserTest < ActiveSupport::TestCase
  test 'should save  user with email' do
    user = User.new
    assert user.save
  end

  test 'should not save user without password' do
    user = User.new
    assert_not user.save
  end
end
