class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_blank: true
  
  after_create :email_users, :update_book_rating
  after_update :update_book_rating


  def email_users
    email_owner(self.user, self.book)
    email_followers(self.book)  
  end

  def update_book_rating
    self.book.update_rating!
  end
  
  def reviewer
    User.find(user_id)
  end

  self.per_page = 5  #pagination

end
