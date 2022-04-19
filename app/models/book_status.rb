class BookStatus < ApplicationRecord
  belongs_to :user
  belongs_to :book, counter_cache: true
  belongs_to :status
end
