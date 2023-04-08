require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'When testing GET users/index request' do
    it 'should get successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'should render the :index template' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end

  context 'When testing GET user/show request ' do
    it 'should get successful response' do
      get '/users/1'
      expect(response).to have_http_status(200)
    end

    it 'should render the :show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end
  end
end
