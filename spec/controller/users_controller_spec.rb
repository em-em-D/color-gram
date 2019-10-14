# frozen_string_literal: true

require 'rails_helper'
require 'rspec/rails'

RSpec.describe UsersController, type: :controller do
  fixtures :users
  include Devise::Test::ControllerHelpers
  describe '#show' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'It should test successfull sigin' do
      sign_in users(:michael)
      expect(response).to have_http_status(:success)
    end

    it 'Sign_up new user ' do
      User.create!(username: 'daniel', email: 'daniel@example.com', password: 'testing654321')
      expect(response).to have_http_status(:success)
    end
  end
end
