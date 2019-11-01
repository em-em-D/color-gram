# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:michael) { FactoryBot.build(:user) }
  let(:luna) { FactoryBot.build(:user) }

  describe 'General user attributes validations' do
    it 'should be valid' do
      assert michael.valid?
    end

    it 'Email should be present' do
      michael.email = ''
      assert !michael.valid?
      michael.email = 'archer.@example.com'
      assert michael.valid?
    end

    it 'Email should be downcase' do
      luna.email = 'LUNA@example.org'
      luna.save!
      expect(luna.email).to eql('luna@example.org')
    end
  end
  describe 'devise specific attributes validations' do
    it 'should include the encrypted_password attribute' do
      expect(luna.attributes).to include('encrypted_password')
    end

    it 'should include the reset_password_sent_at attribute' do
      expect(luna.attributes).to include('reset_password_sent_at')
    end

    it 'should include the reset_password_token attribute' do
      expect(luna.attributes).to include('reset_password_token')
    end

    it 'should include the remember_created_at attribute' do
      expect(luna.attributes).to include('remember_created_at')
    end
  end
end
