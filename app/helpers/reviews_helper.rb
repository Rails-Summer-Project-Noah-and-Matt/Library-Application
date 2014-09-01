module ReviewsHelper
  def rating_view review
    ( review.rating > 0 ) ? review.rating : 'Not rated'
  end

  def email_owner(user, book)


  end

  def email_followers(book)


  end


end
