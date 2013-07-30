require 'test_helper'

class Api::V1::PostsControllerTest < ActionController::TestCase
   test "get index" do
      get :index, format: :json
      assert_response :success
      assert_equal JSON.parse(@response.body).length, 0
   end

   test "get index with data" do 
      post = FactoryGirl.create(:post)
      get :index, format: :json
      assert_response :success
      assert_equal JSON.parse(@response.body)[0], JSON.parse(post.to_json)
   end

   test "create post" do
      assert_difference 'Post.count', 1 do
         post :create, format: :json, post: FactoryGirl.attributes_for(:post)
      end
      assert_response :success
   end

   test "cannot create an post with bad arguments" do
      assert_no_difference 'Post.count' do
         post :create, format: :json, post: {entry: 'Sh'}
      end
      assert_response 422 #unprocessable entry
   end
end
