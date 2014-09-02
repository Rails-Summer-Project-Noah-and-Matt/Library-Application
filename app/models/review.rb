class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_blank: true
  
  after_create :email_users, :update_book_rating
  after_update :update_book_rating

  def email_users
    email_owner(self.book)
    email_following_users(self.book)
  end

  def find_book_owner(book)
    User.find(book.owner_id)
  end

  def email_owner(book)
     user = find_book_owner(book) 
    LibraryMailer.update_user_review_email(user, book).deliver if user.email_prefs.all_reviews
  end
  
  def email_following_users(book)
     users = get_following_users(book)
     users.each do |user|
       LibraryMailer.user_followed_review_email(user, book).deliver
     end
  end

  def get_following_users(book)
    users = []
    book.subscriptions.each do |x|
      user = User.find(x.follower_id)
      users << user if user.email_prefs.all_reviews
    end
    return users
  end
 
  def update_book_rating
    self.book.update_rating!
  end
  
  def reviewer
    User.find(user_id)
  end

  self.per_page = 5  #pagination

end
