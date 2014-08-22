class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  
  def index
    @book = book = Book.find(params[:book_id])
    @reviews = book.reviews
  end

  def show
    @book = book = Book.find(params[:book_id])
    @review = book.reviews.find(params[:id])
  end

  def new
    book = Book.find(params[:book_id])
    @review = book.reviews.build 
  end

  def edit      
    book = Book.find(params[:book_id])
    @review = book.reviews.find(params[:id])
  end

  def create
    book = Book.find(params[:book_id])
    @review = book.reviews.create(review_params)
    @review.user_id = current_user.id

    @item     = @review
    @redirect = [@review.book, @review]
    super
  end


  def update
   
    book = Book.find(params[:book_id])
    @item = @review = book.reviews.find(params[:id])
    @redirect = [@review.book, @review]
    @current_parameters = review_params
    super 
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to(book_reviews_url, notice: 'Review was successfully destroyed.' )}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:text)
    end
end
