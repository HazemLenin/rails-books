require "application_system_test_case"

class BookStatusesTest < ApplicationSystemTestCase
  setup do
    @book_status = book_statuses(:one)
  end

  test "visiting the index" do
    visit book_statuses_url
    assert_selector "h1", text: "Book statuses"
  end

  test "should create book status" do
    visit book_statuses_url
    click_on "New book status"

    fill_in "Book", with: @book_status.book_id
    fill_in "Status", with: @book_status.status_id
    fill_in "User", with: @book_status.user_id
    click_on "Create Book status"

    assert_text "Book status was successfully created"
    click_on "Back"
  end

  test "should update Book status" do
    visit book_status_url(@book_status)
    click_on "Edit this book status", match: :first

    fill_in "Book", with: @book_status.book_id
    fill_in "Status", with: @book_status.status_id
    fill_in "User", with: @book_status.user_id
    click_on "Update Book status"

    assert_text "Book status was successfully updated"
    click_on "Back"
  end

  test "should destroy Book status" do
    visit book_status_url(@book_status)
    click_on "Destroy this book status", match: :first

    assert_text "Book status was successfully destroyed"
  end
end
