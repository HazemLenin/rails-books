class Status < ApplicationRecord
    has_many :book_statuses, dependent: :destroy
    validates :title, presence: true

    def to_s
        self.title
    end
end
