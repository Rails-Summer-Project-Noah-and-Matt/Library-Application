require 'rails_helper'

RSpec.describe SubscriptionsController, :type => :controller do

  before(:all) do
    User.destroy_all
    Book.destroy_all
    @book = FactoryGirl.create(:book)
    @user = FactoryGirl.create(:user)
  end

  it "should create a subscription" do
    sign_in @user
    expect do
      xhr :post, :create, subscription: { followed_id: @book.id }
    end.to change(Subscription, :count).by(1)
  end

  it "should destroy a subscription" do 
    sign_in @user
    xhr :post, :create, subscription: { followed_id: @book.id }
    subscription = @user.subscriptions.find_by(followed_id: @book.id)
   
    expect do
      xhr :delete, :destroy, id: subscription.id
       end.to change(Subscription, :count).by(-1)
    end
  

end
