require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:adam)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "foo@invalid", password: "foo", password_confirmation: "bar"}}
    assert_template 'users/edit'
  end
end
