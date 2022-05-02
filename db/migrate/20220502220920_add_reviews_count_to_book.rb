class AddReviewsCountToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :reviews_count, :integer
  end
end
