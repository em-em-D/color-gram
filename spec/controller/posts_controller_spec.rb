# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:michael) { FactoryBot.create(:user) }
  let(:luna) { FactoryBot.create(:user) }
  let(:post1) { FactoryBot.build(:post) }
  let!(:post2) { FactoryBot.create(:post, user_id: michael.id) }
  describe '#new' do
    it 'Does not render :new when user is not logged in' do
      get :new
      expect(response).to_not render_template(:new)
    end

    it 'Renders :new when User is signed in' do
      sign_in michael
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    before do
      sign_in michael
    end

    it 'Redirects to post_index path upon success' do
      post_params = FactoryBot.attributes_for(:post, user_id: michael.id)
      post :create, params: { post: post_params }
      expect(response).to redirect_to(posts_path)
    end

    it "Icrements user's created posts by one" do
      post_params = FactoryBot.attributes_for(:post, user_id: michael.id)
      expect { post :create, params: { post: post_params } }.to change(michael.posts, :count).by(1)
    end
  end

  describe '#new' do
    it 'Renders template :new when a user is signed in' do
      sign_in michael
      get :new
      expect(response).to render_template(:new)
    end

    it 'Redirects to sign_in page if a user is not signed in' do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
