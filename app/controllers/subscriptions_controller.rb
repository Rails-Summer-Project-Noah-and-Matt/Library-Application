class SubscriptionsController < ApplicationController

  def create
    @book = Book.find(params[:subscription][:followed_id])
    current_user.follow!(@book)
    redirect_to @book
  end

  def destroy
    @book = Subscription.find(params[:id]).followed
    current_user.unfollow!(@book)
    redirect_to @book
  end
 end
