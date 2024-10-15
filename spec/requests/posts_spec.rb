require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }

  before(:each) do
     user_login(user)
  end

  describe "GET /index" do
    it "returns http success" do
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates new post and returns http success" do
      post = build(:post)
      post posts_path, params: { post: { title: post.title, content: post.content } }
      expect(response).to have_http_status(302)
    end

    it "fails to create post and returns http bad request status" do
      post posts_path, params: {}
      expect(response).to have_http_status(:bad_request)
    end

    it "fails to create post and returns http status status" do
      post posts_path, params: { posts: {} }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      post = create(:post_with_user)
      get post_path(post.id)
      expect(response).to have_http_status(:success)
    end

    it "returns http error 404 not found" do
      get post_path(1000022)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      post = create(:post_with_user)
      get edit_post_path(post.id)
      expect(response).to have_http_status(:success)
    end

    it "returns http error status" do
      get edit_post_path(10000)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      post = create(:post_with_user)
      delete post_path(post.id)
      expect(response).to have_http_status(:success)
    end

    it "returns http error status" do
      delete post_path(10000)
      expect(response).to have_http_status(:not_found)
    end
  end
end
