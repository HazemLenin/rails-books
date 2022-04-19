require "test_helper"

class MyLibraryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_library_index_url
    assert_response :success
  end
end
