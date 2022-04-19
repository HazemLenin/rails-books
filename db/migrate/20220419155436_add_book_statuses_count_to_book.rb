class AddBookStatusesCountToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :book_statuses_count, :integer
  end
end
