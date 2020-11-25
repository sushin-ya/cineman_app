require 'test_helper'

class CastsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get casts_index_url
    assert_response :success
  end

  test "should get new" do
    get casts_new_url
    assert_response :success
  end

  test "should get edit" do
    get casts_edit_url
    assert_response :success
  end

end
