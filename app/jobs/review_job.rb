class ReviewJob < ApplicationJob
  queue_as :default

  def perform(review)
    # Do something later
    ActionCable.server.broadcast "books:#{review.book_id}:reviews", {
      data: BooksController.render(partial: 'reviews/review', locals: { review: review })
    }
  end
end
