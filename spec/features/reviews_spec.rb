require 'rails_helper'

describe 'Review Features:' do

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'Index' do
    before(:each) do
      @user      = FactoryGirl.create(:user)
      @bad_user  = FactoryGirl.create(:user, blocked: true)
      @author    = FactoryGirl.create(:author) 
      @book      = FactoryGirl.create(:book, author_id: @author.id)
      @non_book  = FactoryGirl.create(:book, is_active: false)
      @user.email_prefs.all_reviews = true
    end

    it 'does not let non-users review books' do
      visit book_reviews_path @book
      expect(page).to_not have_link('New')
    end
    
    it "lets a user follow a book" do
      visit new_user_session_path
      fill_in 'Email',   with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      visit book_path @book
      expect(page).to have_button('Follow')
      click_button 'Follow'
    end

    it 'lets a user review a book' do
      visit new_user_session_path
      fill_in 'Email',    with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      visit book_reviews_path @book
      expect(page).to have_link('New')
      click_link 'New'
      expect(page).to have_text("New Review of: #{@book.title}")
      fill_in 'review_text', with: 'This is a review'
      click_button 'Create Review'
      expect(page).to have_text("Review was successfully created.")
    end

    it 'does not let a blocked user review a book' do
      visit new_user_session_path
      fill_in 'Email',    with: @bad_user.email
      fill_in 'Password', with: @bad_user.password
      click_button 'Sign in'
      visit book_reviews_path @book
      expect(page).to_not have_link('New')
    end
  end

  describe 'Notifications' do
   
   before(:all) do 
     @user1 = FactoryGirl.create(:user)
     @user2 = FactoryGirl.create(:user)
     @author = FactoryGirl.create(:author) 
     @book  = FactoryGirl.create(:book, author_id: @author.id, owner_id: @user2.id, is_active: true, approved: true)
   end

   it "lets a user follow a book and post a review" do
     visit new_user_session_path
     fill_in 'Email',   with: @user1.email
     fill_in 'Password', with: @user1.password
     click_button 'Sign in'
     visit email_prefs_path @user1
     check 'email_prefs_all_reviews'
     click_button 'Update'
     visit book_path @book
     expect(page).to have_button('Follow')
     click_button 'Follow'
     expect(page).to have_button('Unfollow')
     click_link 'Reviews'
     expect(page).to have_text("Reviews: #{@book.title}")
     click_link 'New'
     fill_in 'review_text', with: 'This is a review'
     click_button 'Create Review'
     expect(page).to have_text("Review was successfully created.")
   end
 end
end
