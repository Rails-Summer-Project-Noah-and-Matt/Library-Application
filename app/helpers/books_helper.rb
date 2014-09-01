module BooksHelper
  def avg_rating_view book
    ( book.rating > 0.0 ) ? '%0.2f' % book.rating : 'No ratings'
  end
end
