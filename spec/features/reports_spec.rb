require 'rails_helper'

describe 'Report Features:' do

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end


  describe 'Index' do
    before(:each) do
      @user   = FactoryGirl.create(:user)
      @admin  = FactoryGirl.create(:admin)
      @author = FactoryGirl.create(:author)
      @book   = FactoryGirl.create(:book, author_id: @author.id, owner_id: @user.id)
      @review = FactoryGirl.create(:review, book_id: @book.id, user_id: @user.id)
      3.times do
        visit new_user_session_path
        fill_in 'Email',    with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'Sign in'
        first(:link, "Logout").click
      end

    end

    describe 'as a user' do
      it "can't be seen" do
        visit reports_path
        expect(page).to have_text 'Naughty!'
      end
    end

    describe 'as an admin' do

      before(:each) do
        visit new_user_session_path
        fill_in 'Email',    with: @admin.email
        fill_in 'Password', with: @admin.password
        click_button 'Sign in'
      end

      describe 'before an impersonation' do
        it 'shows the most logged in user' do
          visit reports_path
          expect(page).to have_text("logins #{@user.id} #{@user.email} 3")
        end
        it 'shows the user with the most reviews' do
          visit reports_path
          expect(page).to have_text("Reviews #{@user.id} #{@user.email} 1")
        end
        it 'shows the user with the most books' do
          visit reports_path
          expect(page).to have_text("Books #{@user.id} #{@user.email} 1")
        end
        it 'shows the user with the lowest ratings' do
          visit reports_path
          expect(page).to have_text("Lowest Ratings ID Email Ratings #{@user.id} #{@user.email} 3.00")
        end
        it 'shows the user with the highest ratings' do
          visit reports_path
          expect(page).to have_text("Highest Ratings ID Email Ratings #{@user.id} #{@user.email} 3.00")
        end
        it 'shows the most active user' do
          visit reports_path
          expect(page).to have_text("Most Activity ID Email Actions #{@user.id} #{@user.email} 6")
        end
      end

      describe 'after an impersonation' do
        it 'still has not changed the most logged in user' do
          visit useradmin_path @user
          click_link 'Impersonate Me!'
          click_link "Stop impersonating"

          visit reports_path
          expect(page).to have_text("logins #{@user.id} #{@user.email} 3")
        end
        it 'still has not changed the most active user' do
          pending
          visit useradmin_path @user
          click_link 'Impersonate Me!'
          visit book_reviews_path @book
          click_link 'New'
          fill_in 'Review', with: "I am impersonating"
          fill_in 'Rating', with: 5
          click_link 'Create Review'
          click_link "Stop impersonating"

          visit reports_path
          expect(page).to have_text("Most Activity ID Email Actions #{@user.id} #{@user.email} 6")
        end
      end

    end

  end

end
