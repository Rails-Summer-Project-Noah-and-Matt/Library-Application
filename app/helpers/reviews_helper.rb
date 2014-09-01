module ReviewsHelper
  def rating_view review
    ( review.rating > 0 ) ? review.rating : 'Not rated'
  end
end
