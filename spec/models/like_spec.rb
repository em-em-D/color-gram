# frozen_string_literal: true

RSpec.describe Like, type: :model do
  let(:like) { FactoryBot.create(:Like) }
  describe 'test for presence of model attributes generated by the associatons' do
    it 'should include post_id attribute' do
      expect(like.attributes).to include('post_id')
    end
  end
end
