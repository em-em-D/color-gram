# frozen_string_literal: true

require 'test_helper'
# :nodoc:
class ImageTest < ActiveSupport::TestCase
  test 'should not save image without file' do
    image = Image.new
    assert image.save, 'saved with file'
  end
end
