class ReviewsController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:index, :show, :new, :edit, :create, :update]

  before_filter :check_valid_user, only:  [:edit, :update, :destroy, :new] 
  
  def index
    @reviews = @book.reviews.order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  def new
    @book.reviewable? || err = "#{@book.title} is inactive and can't be reviewed."
    ( current_user && !current_user.blocked ) || err = "You are blocked or not logged in."
    ( redirect_to(:back, notice: err) and return ) if err
    @review = @book.reviews.build 
  end

  def create
    @review = @book.reviews.create(review_params)
    @review.user_id = current_user.id

    @item     = @review
    @redirect = [@review.book, @review]
    super
  end

  def update
    @item = @review
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

    def sort_column
      Review.column_names.include?(params[:sort]) ? params[:sort] : "rating"
    end
  
    def set_review
      @review = Review.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      params.require(:review).permit(:text, :rating)
    end
end
