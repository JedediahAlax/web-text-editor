require 'test_helper'

class SplashPageControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should get home' do
    get welcome_loggedIn_url
    assert_response :success
  end
end
