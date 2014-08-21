class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  
  # GET /posts/:post_id/comments
  def index
    book = Book.find(params[:book_id])
    @book = book
    @reviews = book.reviews
  end

  # GET /books/:book_id/comments/:id
  def show
    book = Book.find(params[:book_id])
    @book = book
    @review = book.reviews.find(params[:id])
  end

  # GET /books/:book_id/comments/new
  def new
    book = Book.find(params[:book_id])
    @review = book.reviews.build 
  end

  # GET /books/:book_id/reviews/:id/edit
  def edit      
    book = Book.find(params[:book_id])
    @review = book.reviews.find(params[:id])
  end

  # POST /books/:book_id/reviews
  def create
    book = Book.find(params[:book_id])
    @review = book.reviews.create(review_params)
    @review.user_id = current_user.id

    respond_to_create({thing: @review, redirect: ([@review.book, @review])})
  end


  # PUT /posts/:post_id/comments/:id
  # PATCH/PUT /reviews/1
  def update
   
    book = Book.find(params[:book_id])
    @review = book.reviews.find(params[:id])
   
    respond_to_update({thing: @review, redirect: ([@review.book, @review])})
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to_destroy({thing: @review, redirect: book_reviews_url, name: "Review"})
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
