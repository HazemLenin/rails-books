class AddPagesToBookStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :book_statuses, :pages, :integer, default: 0
  end
end
