class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  
  # GET /posts/:post_id/comments
  def index
    book = Book.find(params[:book_id])
    @reviews = book.reviews
  end

  # GET /books/:book_id/comments/:id
  def show
    book = Book.find(params[:book_id])
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
    respond_to do |format|
      if @review.save
        format.html { redirect_to([@review.book, @review],  notice: 'Review was successfully created.') }
        format.json { render :show, status: :created, location: [@review.book, @review] }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /posts/:post_id/comments/:id
  # PATCH/PUT /reviews/1
  def update
   
    book = Book.find(params[:book_id])
    @review = book.reviews.find(params[:id])
   
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to([@review.book, @review], notice: 'Review was successfully updated.') }
        format.json { render :show, status: :ok, location: [@review.book, @review] }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to(books_review_url, notice: 'Review was successfully destroyed.' )}
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
      params.require(:review).permit(:review)
    end
end
