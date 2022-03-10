require 'test_helper'

class UsersSignUpTest < ActionDispatch::IntegrationTest
  
test "get new user form and create user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { email: "example@email.com", password: "password" } }
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_match "password", response.body
  end
end
end