require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "get new user form and create user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count' do
      post_via_redirect users_path, user: {username: "cheng", email: "cheng@example.com", password: "password", admin: false}
    end
    assert_template 'users/show'
    assert_match "cheng", response.body
  end
end
