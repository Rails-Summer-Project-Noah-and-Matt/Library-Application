class ReportsController < ApplicationController

  ReportMax = 5

  before_action :require_admin

  def index
    @most_logins = most_logins
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

  def most_reviews
    reviewers = Review.all.map{|r| r.user_id}
  end

end

