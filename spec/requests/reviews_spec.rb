require 'rails_helper'

RSpec.describe ReviewsController, type: :request do
  describe 'GET /reviews' do
    let(:headers) { { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json'} }
    let(:params) { { reviews: { user_id: user.id, status: status } } }
    subject(:req) { get reviews_path, { headers: headers, params: params } }
    let(:body) { JSON.parse(response.body) }

    let(:user) { FactoryBot.create(:user) }

    before do
      FactoryBot.create(:review, :draft, user_id: user.id, content: 'first draft review.')
      FactoryBot.create(:review, :draft, user_id: user.id, content: 'second draft review.')
      FactoryBot.create(:review, :published, user_id: user.id, content: 'first published review.')
      FactoryBot.create(:review, :published, user_id: user.id, content: 'second published review.')
      FactoryBot.create(:review, :published, user_id: user.id, content: 'third published review.')
    end

    context '下書きを指定した場合' do
      let(:status) { :draft }
      it '下書きの口コミが取得できること' do
        req
        expect(body.all?{ |b| b['status'] == 'draft' }).to be_truthy
      end
    end

    context '公開中を指定した場合' do
      let(:status) { :published }
      it '公開している口コミがが取得できること' do
        req
        expect(body.all?{ |b| b['status'] == 'published' }).to be_truthy
      end
    end
  end
end
