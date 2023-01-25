require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:request) { get user_posts_path(user_id: 1) }

    it 'returns http success' do
      request
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      request
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text' do
      request
      expect(response.body).to include('comment 1')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get user_post_path(user_id: 1, id: 1)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_post_path(user_id: 1, id: 1)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text' do
      get user_post_path(user_id: 1, id: 1)
      expect(response.body).to include('lorem mndhdjbzsnnjndmsnnnjsnjnjsj')
    end
  end
end
