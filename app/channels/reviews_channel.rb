# class ReviewsChannel < ApplicationCable::Channel
#   def subscribed
#     stop_all_streams

#     # stream_from "some_channel"
#     stream_from "books:#{params[:book_id].to_i}:reviews"
#   end

#   def unsubscribed
#     # Any cleanup needed when channel is unsubscribed
#     stop_all_streams
#   end

#   def post data
#     content = data["content"]
#     rate = data["rate"].to_i
#     Review.create!([{user_id: params[:user_id], book_id: params[:book_id], content: content, rate: rate}])
#   end
# end