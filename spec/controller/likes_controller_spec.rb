# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:michael) { FactoryBot.create(:user) }
  let(:post1) { FactoryBot.create(:post, user_id: michael.id) }
  let(:comment1) { FactoryBot.create(:comment, user_id: michael.id, post_id: post1.id) }

  describe '#create' do
    before do
      sign_in michael
    end

    context 'When liking a post' do
      it 'Redirects to post path upon success' do
        post :create, params: { post_id: post1.id }
        expect(response).to redirect_to(posts_path)
      end

      it 'increaments the posts likes by one' do
        expect { post :create, params: { post_id: post1.id } }.to change(post1.likes, :count).by(1)
      end
    end

    context 'When liking a post' do
      it 'Redirects to post path upon success' do
        post :create, params: { post_id: post1.id }
        expect(response).to redirect_to(post_path)
      end

      it 'increaments the posts likes by one' do
        expect { post :create, params: { post_id: post1.id } }.to change(post1.likes, :count).by(1)
      end

      it 'increaments user likes by one' do
        expect { post :create, params: { post_id: post1.id } }.to change(michael.likes, :count).by(1)
      end
    end
  end

  describe '#destroy' do
    before do
      sign_in michael
      post :create, params: { post_id: post1.id }
    end
    context 'When disliking a post' do
      it 'Decrements post likes by one' do
        expect { delete :destroy, params: { post_id: post1.id } }.to change(post1.likes, :count).by(-1)
      end

      it 'Decrements user likes by one' do
        expect { delete :destroy, params: { post_id: post1.id } }.to change(michael.likes, :count).by(-1)
      end
    end
  end
end
