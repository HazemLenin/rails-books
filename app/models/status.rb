class Status < ApplicationRecord
    has_many :book_statuses, dependent: :destroy
    validate :title

    def to_s
        self.title
    end
end
