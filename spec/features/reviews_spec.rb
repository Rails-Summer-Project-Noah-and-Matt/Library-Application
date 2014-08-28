require 'rails_helper'

describe 'Review Features:' do

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'Index' do
    before(:each) do
      @user      = FactoryGirl.create(:user)
      @bad_user  = FactoryGirl.create(:user, blocked: true)
      @book      = FactoryGirl.create(:book)
      @non_book  = FactoryGirl.create(:book, is_active: false)
    end

    it 'does not let non-users review books' do
      visit book_reviews_path @book
      expect(page).to_not have_link('New')
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

end

