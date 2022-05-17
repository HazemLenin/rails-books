class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  # GET /books or /books.json
  def index
    @q = policy_scope(Book).ransack(params[:q])
    @pagy, @books = pagy(@q.result(distinct: true))
  end

  # GET /books/1 or /books/1.json
  def show
    @author = @book.user
    if user_signed_in?
      @book_status = BookStatus.where(user: current_user, book: @book).first # to show user book_status in book view
    end
    @review = Review.new
    @reviews = @book.reviews.order(created_at: :desc)
  end

  # GET /books/new
  def new
    @book = Book.new
    authorize @book
  end

  # GET /books/1/edit
  def edit
    authorize @book
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    authorize @book
    @book.user = current_user
    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    authorize @book
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    authorize @book
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :publication_date, :chapters, :page_count, :cover, :description)
    end

end
