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

    it 'the response.body should includes correct placeholder text.' do
      get '/users'
      expect(response.body).to include('<p>Here is a list of users</p>')
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

    it 'the response.body should includes correct placeholder text.' do
      get '/users/1'
      expect(response.body).to include('<p>Here is a single user</p>')
    end
  end
end
