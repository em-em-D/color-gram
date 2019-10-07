# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:michael) { FactoryBot.create(:user) }
  describe '#show' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    it 'It should not render registration when user in not signed_up in' do
      get :new_user_registration
      expect(response).to_not render_template(:new_user_registration)
    end

    it 'Renders :new when a user is logged in' do
      sign_in michael
      get :new, params: { id: michael.id }
      expect(response).to render_template(:new)
    end
  end

  describe '#index' do
    before do
      sign_in michael
    end

    it 'Successfully sends a get request to user#edit route' do
      get :edit_user_registration
      expect(response.status).to eql(200)
    end

    it 'Renders user login page in new session' do
      get :new_user_session
      expect(response).to render_template(:new_user_session)
    end
  end
end
