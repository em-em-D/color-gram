# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:michael) { FactoryBot.create(:user) }
  let(:luna) { FactoryBot.create(:user) }
  let(:post1) { FactoryBot.create(:post, user_id: michael.id) }
  let(:comment1) { FactoryBot.create(:comment, user_id: michael.id, post_id: post1.id) }
  let(:comment2) { FactoryBot.build(:comment, user_id: michael.id) }

  describe '#create' do
    before do
      sign_in michael
    end

    it 'Redirects to post path upon success' do
      post :create, params: { comment: { body: comment1.body, post_id: post1.id } }
      expect(response).to redirect_to(post_path)
    end

    it "increase user's created comments by one" do
      comment_params = FactoryBot.attributes_for(:comment, post_id: post1.id)
      expect { post :create, params: { comment: comment_params } }.to change(michael.comments, :count).by(1)
    end
  end
end
