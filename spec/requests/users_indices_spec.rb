require 'rails_helper'

RSpec.describe "UsersIndices", type: :request do
  describe "GET /users_indices" do
    it "works! (now write some real specs)" do
      get users_indices_path
      expect(response).to have_http_status(200)
    end
  end
end
