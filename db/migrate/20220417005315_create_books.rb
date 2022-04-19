class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.date :publication_date, null: false
      t.integer :chapters, null: false
      t.integer :page_count, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
