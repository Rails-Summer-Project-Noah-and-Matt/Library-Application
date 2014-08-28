class SubscriptionController < ApplicationController

  def new 
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new
    @subscription.followed_id = params[:followed_id]
    @subscription.follower_id = current_user.id
    @subscription.save
    #redirect_to book_path(Book.find(params[:followed_id]))
    redirect_to :back 
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @book = Book.find(@subscription.followed_id)
    @subscription.destroy
    #redirect_to book_path(@book.id)
    redirect_to :back 
   end
 end
