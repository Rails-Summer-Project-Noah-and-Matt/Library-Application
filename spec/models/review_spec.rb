require 'rails_helper'

RSpec.describe Review, :type => :model do

#  before(:each) do 
#    User.destroy_all
#    Book.destroy_all
#    Review.destroy_all
#    ActionMailer::Base.delivery_method = :test
#    ActionMailer::Base.perform_deliveries = true
#    ActionMailer::Base.deliveries = []
#    @user = FactoryGirl.create(:user)
#    @book = FactoryGirl.create(:book, :owner_id => @user.id)
#    @reviewer = FactoryGirl.create(:user)
#  end


# it "should email a an owner of a book if they opted to" do
#    @user.email_prefs.all_reviews = true
#    Review.create!(text: 'This is a stupid review', user_id: @reviewer.id, book_id: @book.id) 
#    Review.all
#    ActionMailer::Base.deliveries.should == 1 
#  end

end
