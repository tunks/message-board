require 'rails_helper'

RSpec.describe "Users", type: :request do
  # describe "GET /index" do
  #   it "returns http success" do
  #     get "/users/index"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  let(:user) { create(:user) }
  before(:each) do
    user_login(user)
  end

  describe "GET /new" do
    it "returns http success" do
      get new_user_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET user" do
    it "returns http success" do
      get user_path(user.id)
      expect(response).to have_http_status(:success)
    end

    it "returns http 404 error not found" do
      get user_path(1000001)
      expect(response).to have_http_status(:not_found)
    end
  end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/users/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
