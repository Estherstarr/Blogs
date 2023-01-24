require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    let(:request) { get users_path }

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
      expect(response.body).to include("Here's a list of Users")
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get user_path(id: 1)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_path(id: 1)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text' do
      get user_path(id: 1)
      expect(response.body).to include('Post 3')
    end
  end
end
