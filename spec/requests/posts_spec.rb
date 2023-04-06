require 'rails_helper'

RSpec.describe "Posts", type: :request do
  context "When testing GET posts/index request" do
    it 'should get successful response' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end
    
    it 'should render the :index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'the response.body should includes correct placeholder text.' do
      get '/users/1/posts'
      expect(response.body).to include("<p>Here is a list of post for a given user</p>")
    end    
  end

  context 'When testing GET post/show request ' do
    it 'should get successful response' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(200)
    end

    it 'should render the :show template' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'the response.body should includes correct placeholder text.' do
      get '/users/1/posts/1'
      expect(response.body).to include("<p>Here is a single post for a given user</p>")
    end
  end
end
