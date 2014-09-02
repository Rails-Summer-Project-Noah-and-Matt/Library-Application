class ReportsController < ApplicationController

  ReportMax = 5

  before_action :require_admin

  def index
    @most_logins = most_logins
    @most_reviews = most_reviews
    @most_books = most_books
    @highest_ratings = highest_ratings
    @lowest_ratings = lowest_ratings
    @most_activity = most_activity
  end

  private

  def require_admin
    unless ( current_user && current_user.admin )
      flash[:error] = 'Naughty!'
      redirect_to(root_path) 
    end
  end

  def most_logins
    User.order('sign_in_count DESC').take(ReportMax)
  end

  def all_reviews
    reviews = Review.where('text IS NOT NULL')
    reviewer_reviews = Hash.new(0)
    reviews.map do |r|
      reviewer_reviews[r.true_user_id] += 1
    end
    reviewer_reviews
  end

  def most_reviews
    most = all_reviews.sort_by{|reviewer, reviews| reviews}.reverse.take(ReportMax)
    presentables= []
    most.map do |el|
      reviewer = {}
      reviewer[:user] = User.find(el[0])
      reviewer[:reviews] = el[1]
      presentables << reviewer
    end
    presentables
  end

  def all_books
    books = Book.all
    owner_books = Hash.new(0)
    books.map do |b|
      owner_books[b.true_user_id] += 1
    end
    owner_books
  end

  def most_books
    most = all_books.sort_by{|owner, books| books}.reverse.take(ReportMax)
    presentables= []
    most.map do |el|
      owner = {}
      owner[:user] = User.find(el[0])
      owner[:books] = el[1]
      presentables << owner
    end
    presentables
  end

  def all_ratings
    ratings = rated
    rater_ratings = Hash.new(0)
    ratings.map do |r|
      rater_ratings[r.true_user_id] += 1
    end
    rater_ratings
  end

  def most_activity
    users = User.all
    user_actions = Hash.new(0)
    users.map do |u|
      user_actions[u.id] += all_ratings[u.id]
      user_actions[u.id] += all_books[u.id]
      user_actions[u.id] += all_reviews[u.id]
      user_actions[u.id] += u.sign_in_count
    end
    most = user_actions.sort_by{|id, actions| actions}.reverse.take(ReportMax)
    presentables = []
    most.map do |el|
      actor = {}
      actor[:user] = User.find(el[0])
      actor[:actions] = el[1]
      presentables << actor
    end
    presentables
  end

  def highest_ratings
    most = rating_averages.reverse
    presentables= []
    most.map do |el|
      rater = {}
      rater[:user] = User.find(el[0])
      rater[:avg]  = el[1]
      presentables << rater
    end
    presentables
  end

  def lowest_ratings
    most = rating_averages
    presentables= []
    most.map do |el|
      rater = {}
      rater[:user] = User.find(el[0])
      rater[:avg]  = el[1]
      presentables << rater
    end
    presentables
  end

  def rated
    Review.where('rating > 0')
  end

  def rating_averages
    ratings = rated
    stats = {}
    rater_ratings = Hash.new(0)
    ratings.map do |r|
      stats[r.true_user_id.to_s.to_sym] ||= {rated: 0, sum: 0} 
      stats[r.true_user_id.to_s.to_sym][:rated] += 1
      stats[r.true_user_id.to_s.to_sym][:sum] += r.rating
    end
    averages = {}
    stats.map do |id, s|
      averages[id] = s[:sum] / s[:rated].to_f
    end
    averages.sort_by{|id, avg| avg}
  end

end

