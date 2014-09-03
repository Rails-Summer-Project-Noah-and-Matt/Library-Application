class BooksController < ApplicationController

  helper_method :sort_column, :sort_direction

  before_action :set_book, only: [:show, :edit, :update, :destroy, :approve, :deactivate, :reactivate]
  before_filter :check_valid_user, only: [:new, :edit, :update, :destroy]

  def index
    @q = Book.search(params[:q])
    @books = @q.result.includes(:author, :reviews, :tags)
    @books = @books.where(approved: true) unless ( current_user && current_user.admin )
    @books = @books.order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.owner_id = current_user.id
    @item = @book
    super
  end

  def update
    unless ( @book.owner_id == current_user.id || current_user.admin )
      redirect_to book_url, notice: "You can't edit someone else's book"
      return
    end
    @item = @book
    @current_parameters = book_params
    super
  end

  def destroy
    notice = "You can't destroy a reviewed book, or one you don't own"
    if (@book.destroyable? && @book.owner_id == current_user.id)
      @book.destroy
      notice = 'Book was successfully destroyed.'
    end
    respond_to do |format|
      format.html { redirect_to books_url, notice: notice }
      format.json { head :no_content }
    end
  end

  def approve
    notice = "Couldn't approve; something is wrong."
    notice = '' if ( current_user && current_user.admin && @book.approve!)
    redirect_to books_url, notice: notice
  end

  def deactivate
    notice = "Couldn't deactivate; something is wrong."
    notice = '' if ( current_user && @book.toggle_active! )
    redirect_to books_url, notice: notice
  end

  def reactivate
    notice = "Couldn't reactivate; something is wrong."
    notice = '' if ( current_user && @book.toggle_active! )
    redirect_to books_url, notice: notice
  end

  def search
    index
    render :index
  end

  private
    
  def sort_column
    Book.column_names.include?(params[:sort]) ? params[:sort] : "rating"
  end
  
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title,
                                 :isbn10,
                                 :isbn13,
                                 :is_active,
                                 :approved,
                                 :tag_list,
                                 :cover,
                                 :cover_cache,
                                 :remote_cover_url,
                                 :owner_id,
                                 :author_id,
                                 author_attributes: [:given_name, :family_name])
  end
end
