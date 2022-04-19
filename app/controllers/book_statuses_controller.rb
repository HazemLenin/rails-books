class BookStatusesController < ApplicationController
  before_action :set_book_status, only: %i[ show edit update destroy ]
  before_action :set_book, except: :index
  before_action :authenticate_user!

  # GET /book_statuses or /book_statuses.json
  def index
    @book_statuses = BookStatus.all
  end

  # GET /book_statuses/1 or /book_statuses/1.json
  def show
  end

  # GET /book_statuses/new
  def new
    @book_status = BookStatus.new
    old_book_status = BookStatus.where(user_id: current_user.id, book_id: @book.id)
    
    if old_book_status.exists?
      redirect_to edit_book_book_status_path(@book, old_book_status.first)
    end
  end

  # GET /book_statuses/1/edit
  def edit
  end

  # POST /book_statuses or /book_statuses.json
  def create
    @book_status = BookStatus.new(book_status_params)

    @book_status.book_id = @book.id
    @book_status.user_id = current_user.id

    respond_to do |format|
      if @book_status.save
        # format.html { redirect_to book_book_status_url(@book, @book_status), notice: "Book status was successfully created." }
        format.html { redirect_to book_url(@book), notice: "Book status was successfully created." }
        format.json { render :show, status: :created, location: @book_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_statuses/1 or /book_statuses/1.json
  def update
    respond_to do |format|
      if @book_status.update(book_status_params)
        # format.html { redirect_to book_book_status_url(@book, @book_status), notice: "Book status was successfully updated." }
        format.html { redirect_to book_url(@book), notice: "Book status was successfully updated." }
        format.json { render :show, status: :ok, location: @book_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_statuses/1 or /book_statuses/1.json
  def destroy
    @book_status.destroy

    respond_to do |format|
      # format.html { redirect_to book_book_statuses_url(@book), notice: "Book status was successfully destroyed." }
      format.html { redirect_to book_url(@book), notice: "Book status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_status
      @book_status = BookStatus.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a list of trusted parameters through.
    def book_status_params
      params.require(:book_status).permit(:status_id)
    end
end
