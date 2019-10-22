require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    let(:headers) { { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json'} }
    subject(:req) { get users_path, { headers: headers, params: {} } }


    context 'use create_list' do
      before do
        FactoryBot.create_list(:user, 100)
      end
      it 'get users' do
        req
        expect(response).to have_http_status(200)
      end
    end

    context 'use build_list + insert_all(rails >=6.0.0)' do
      before do
        users = FactoryBot.build_list(:user, 100, created_at: Time.current, updated_at: Time.current)
        User.insert_all users.map(&:attributes)
      end
      it 'get users' do
        req
        expect(response).to have_http_status(200)
      end
    end

    context 'use build_list + import(gem activerecord-import)' do
      before do
        users = FactoryBot.build_list(:user, 100)
        User.import users
      end
      it 'get users' do
        req
        expect(response).to have_http_status(200)
      end
    end
  end
end
