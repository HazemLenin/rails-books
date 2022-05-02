class Review < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :book, counter_cache: true

  validates :content, presence: true
  validates :rate, presence: true
end
