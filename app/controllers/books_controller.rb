class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :check_valid_user, only: [:new, :edit, :update, :destroy]
  def index
    @books = Book.all
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
    @item = @book
    @current_parameters = book_params
    super
    notice = "you can't edit a book you don't own"
  end

  def destroy
    
    unless @book.owner_id != current_user.id
      if @book.destroyable?
        @book.destroy
        notice = 'Book was successfully destroyed.'
      else 
        notice = "You can't destroy a reviewed book"
      end
    else
      notice = "You can't destroy a book you don't own"
    end
    
    respond_to do |format|
      format.html { redirect_to books_url, notice: notice }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title,
                                   :isbn10,
                                   :isbn13,
                                   :is_active,
                                   :tag_list,
                                   :cover,
                                   :cover_cache,
                                   :remote_cover_url,
                                   :owner_id,
                                   :author_id,
                                   author_attributes: [:given_name, :family_name])
    end
end
