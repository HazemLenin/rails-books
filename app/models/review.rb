class Review < ApplicationRecord
  after_create_commit { ReviewJob.perform_later(self) }
  belongs_to :user, counter_cache: true
  belongs_to :book, counter_cache: true

  validates :content, presence: true
  validates :rate, presence: true
end
