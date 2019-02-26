require 'test_helper'

class TextboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get textbox" do
    get textboxes_textbox_url
    assert_response :success
  end

end
