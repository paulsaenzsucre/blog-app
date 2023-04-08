require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  context 'When testing POST likes/create request' do
    it 'should get successful response' do
      post '/users/1/posts/1/likes'
      expect(response).to have_http_status(302)
    end
  end
end
