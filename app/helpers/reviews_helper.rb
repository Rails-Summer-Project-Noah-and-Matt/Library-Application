module ReviewsHelper
  def rating_view review
    ( review.rating > 0 ) ? review.rating : 'Not rated'
  end

  def email_owner(user, book)
     if user.email_prefs.all_reviews
       LibraryMailer.update_user_review_email(user, book)
     end
  end

  def email_followers(book)
      
  end
 
  def find_followers(book)
    users = [] 
    book.subscriptions.each do |x|
      users << x.follower_id 
    end  
  end

 

 
end
