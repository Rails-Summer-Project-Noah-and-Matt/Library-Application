class SubscriptionController < ApplicationController

  def create
    @book = Book.find(params[:followed_id])
    current_user.follow!(@book)
    redirect_to @book
  end

  def destroy
    @book = Book.find(params[:followed_id])
    current_user.unfollow!(@book)
    redirect_to @book
  end
end
