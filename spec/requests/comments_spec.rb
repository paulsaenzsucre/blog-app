require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  context 'When testing GET comments/new request' do
    it 'should get successful response' do
      get '/users/1/posts/1/comments/new'
      expect(response).to have_http_status(200)
    end
  end
end
