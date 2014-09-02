require "rails_helper"

RSpec.describe LibraryMailer, :type => :mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    @user = FactoryGirl.create(:user)
    @book = FactoryGirl.create(:book)
    LibraryMailer.update_user_review_email(@user, @book).deliver
    LibraryMailer.user_followed_review_email(@user, @book).deliver
  end

  it 'should send emails' do
    ActionMailer::Base.deliveries.count.should == 2
  end

end

