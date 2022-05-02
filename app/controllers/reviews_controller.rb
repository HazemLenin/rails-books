class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @book = Book.find(params[:book_id])
        @review = Review.new(review_params)

        @review.book_id = @book.id
        @review.user_id = current_user.id

        respond_to do |format|
            if @review.save
                format.html { redirect_to book_url(@book), notice: "Review was successfully created." }
                format.json { render :show, status: :created, location: @book }
            else
                format.html { redirect_to book_url(@book), alert: "Something missing", status: :unprocessable_entity }
                format.json { render json: @review.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @book = Book.find(params[:book_id])
        @review = Review.new(review_params)
        @review.destroy

        respond_to do |format|
            format.html { redirect_to book_url(@book), notice: "Review was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
        @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
        params.require(:review).permit(:content, :rate)
    end
end