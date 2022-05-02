class Book < ApplicationRecord
  after_commit :add_default_cover, on: [:create, :update]

  belongs_to :user

  has_many :book_statuses, dependent: :destroy

  has_one_attached :cover

  validates :title, presence: true, length: {:maximum => 150}
  validates :publication_date, presence: true
  validates :chapters, presence: true
  validates :page_count, presence: true
  validates :cover,
    content_type: ['image/png', 'image/jpg', 'image/jpeg'], size: { less_than: 500.kilobytes , message: 'size should be under 500 kilobytes' }
  validates :description, presence: true

  def to_s
    self.title + ' by ' + user.get_full_name
  end

  scope :latest, -> { limit(3).order(created_at: :desc) }
  scope :popular, -> { limit(3).order(book_statuses_count: :desc) }

  private

  def add_default_cover
    unless cover.attached?
      self.cover.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_cover.jpg")), filename: 'default_cover.jpg' , content_type: "image/jpg")
    end
  end
end
