# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post1) { FactoryBot.create(:post) }
  let(:luna) { FactoryBot.build(:user) }

  describe 'General Post attributes validations' do
    it 'should be valid' do
      expect(post1.errors.full_messages).to eql([])
      assert post1.valid?
    end

    it 'Content should be present' do
      post1.description = ''
      assert !post1.valid?
      post1.description = 'Just some text'
      assert post1.valid?
    end
  end
end
