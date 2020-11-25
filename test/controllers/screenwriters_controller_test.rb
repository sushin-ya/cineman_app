require 'test_helper'

class ScreenwritersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get screenwriters_index_url
    assert_response :success
  end

  test "should get new" do
    get screenwriters_new_url
    assert_response :success
  end

  test "should get edit" do
    get screenwriters_edit_url
    assert_response :success
  end

end
