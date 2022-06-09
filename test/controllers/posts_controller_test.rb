require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    test "can get index" do
      get posts_url
      assert_response :success
    end
end