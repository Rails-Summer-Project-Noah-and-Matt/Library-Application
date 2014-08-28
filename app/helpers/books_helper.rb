module BooksHelper

  def find_subscription_id
     Subscription.find_by(follower_id: current_user.id, followed_id: @book.id).id 
  end

end
