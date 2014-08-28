class SubscriptionController < ApplicationController

  def new 
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new
    @subscription.followed_id = params[:followed_id]
    @subscription.follower_id = current_user.id
    respond_to do |format|
      if @subscription.save
          format.html { redirect_to :controller => 'books', :action => 'index' }
      else
          format.html { render action: "new" }
      end
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @book = Book.find(@subscription.followed_id)
    @subscription.destroy
    redirect_to book_path(@book.id)
   end
 end
