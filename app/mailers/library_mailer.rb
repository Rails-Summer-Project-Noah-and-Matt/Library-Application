class LibraryMailer < ActionMailer::Base
  default from: "from@example.com"


  def update_user_rating_email(user, book)
    @user = user
    @book = book
    mail(to: @user.email, subject: "#{@book.title} has a new rating")
  end

  def update_user_review_email(user, book)
    @user = user
    @book = book
    mail(to: @user.email, subject: "#{@book.title} has a new review")
  end

  def user_followed_review_email(user, book)
    @user = user
    @book = book
    mail(to: @user.email, subject: "The book you are following #{@book.title} has a new review")
  end

  def user_followed_rating_email(user, book)
    @user = user
    @book = book
    mail(to: @user.email, subject: "The book you are following #{@book.title} has a new rating")
  end


end
