require "test_helper"

class BookStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book_status = book_statuses(:one)
  end

  test "should get index" do
    get book_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_book_status_url
    assert_response :success
  end

  test "should create book_status" do
    assert_difference("BookStatus.count") do
      post book_statuses_url, params: { book_status: { book_id: @book_status.book_id, status_id: @book_status.status_id, user_id: @book_status.user_id } }
    end

    assert_redirected_to book_status_url(BookStatus.last)
  end

  test "should show book_status" do
    get book_status_url(@book_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_status_url(@book_status)
    assert_response :success
  end

  test "should update book_status" do
    patch book_status_url(@book_status), params: { book_status: { book_id: @book_status.book_id, status_id: @book_status.status_id, user_id: @book_status.user_id } }
    assert_redirected_to book_status_url(@book_status)
  end

  test "should destroy book_status" do
    assert_difference("BookStatus.count", -1) do
      delete book_status_url(@book_status)
    end

    assert_redirected_to book_statuses_url
  end
end
