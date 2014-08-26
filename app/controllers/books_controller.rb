class BooksController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :check_valid_user, only: [:new, :edit, :update, :destroy]

  def index
    @books = Book.order(sort_column + " " + sort_direction)
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
  end

  def destroy
    notice = "You can't destroy a viewed book."
    if @book.destroyable?
      @book.destroy
      notice = 'Book was successfully destroyed.'
    end
    respond_to do |format|
      format.html { redirect_to books_url, notice: notice }
      format.json { head :no_content }
    end
  end

  def author_name
    author.sortable_name
  end

  private
    
    def sort_column
      Book.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
    
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
