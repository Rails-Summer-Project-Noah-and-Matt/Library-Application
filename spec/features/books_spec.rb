require 'rails_helper'

describe 'Book Features:' do

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  let(:user)   { FactoryGirl.create(:user) }
  let(:author) { FactoryGirl.create(:author) }
  let(:book)   { FactoryGirl.create(:book, owner_id: user) }
  let(:review) { FactoryGirl.create(:review, book: book) }

  describe 'Index' do
    before(:all) do
      @owner  = FactoryGirl.create(:user)
      @author = FactoryGirl.create(:author)

      @unapproved_book = FactoryGirl.create(:book, owner_id: @owner.id, author_id: @author.id) 
      @approved_book = FactoryGirl.create(:book, owner_id: @owner.id, author_id: @author.id, approved: true) 
    end

    it 'should not list the unapproved book titles' do
      visit books_path
      expect(page).to_not have_content(@unapproved_book.title)
    end

    it 'should list the approved book titles' do
      visit books_path
      expect(page).to have_content(@approved_book.title)
    end

    describe 'As Admin' do
      before(:all) do
        @admin = FactoryGirl.create(:admin)
      end
      before(:each) do
        visit new_user_session_path
        fill_in 'Email', with: @admin.email
        fill_in 'Password', with: @admin.password
        click_button 'Sign in'
      end

      it 'should list the unapproved book titles' do
        visit books_path
        expect(page).to have_content(@unapproved_book.title)
      end

      it 'should let us approve unapproved titles' do
        visit books_path
        click_link 'Approve'
        expect(page).to have_link('Deactivate', :count => 2)
      end

      it 'should let us deactivate approved titles' do
        visit books_path
        click_link 'Deactivate'
        expect(page).to have_link('Reactivate', count: 1)
      end

      it 'should let us reactivate deactivated titles' do
        visit books_path
        click_link 'Deactivate'
        click_link 'Reactivate'
        expect(page).to have_link('Deactivate', count: 1)
      end

    end

  end

  describe 'Changing:' do
    before(:each) do
      @me   = FactoryGirl.create(:user)
      @she  = FactoryGirl.create(:user)
      @author = FactoryGirl.create(:author)
      @her_book = FactoryGirl.create(:book, owner_id: @she.id, author_id: @author.id)
      @my_book  = FactoryGirl.create(:book, owner_id: @me.id, author_id: @author.id)
    end

    describe 'as a logged in user,' do
      before(:each) do
        visit new_user_session_path
        fill_in 'Email', with: @me.email
        fill_in 'Password', with: @me.password
        click_button 'Sign in'
      end

      describe 'a book I own' do
        it "I can destroy" do
          visit book_path @my_book
          expect{ click_link 'Delete' }.to change {Book.count}.by(-1)
        end
        it "I can edit" do
          visit book_path @my_book
          click_link 'Edit'
          expect(page).to have_text "Edit Book"
        end
      end

      describe 'a book I do not own' do
        it "I can't destroy" do
          visit book_path @her_book
          expect(page).to_not have_button("Delete")
        end
        it "I can't edit" do
          visit edit_book_path @her_book
          click_button 'Update Book'
          expect(page).to have_text("You can't edit someone else's book")
        end
      end

      describe 'a book without reviews' do
        it "should be deletable" do
          expect(@my_book.destroyable?).to be true
        end
      end

      describe 'a book with reviews' do
        before(:each) do
          @reviewer = FactoryGirl.create(:user)
          @book     = FactoryGirl.create(:book)
          @review   = FactoryGirl.create(:review, book: @book, user: @reviewer)
        end
        it "should not be deletable" do
          expect(@book.destroyable?).to be false
        end
      end
    end
  end

  describe 'Reviewing' do

    describe 'an active book' do
      before(:each) do
        @book = FactoryGirl.create(:book)
        @book.is_active = true
      end
      it "should be reviewable" do
        expect(@book.reviewable?). to be true
      end
    end

    describe 'an inactive book' do
      before(:each) do
        @author = FactoryGirl.create(:author)
        @book   = FactoryGirl.create(:book, author: @author)
        @book.is_active = false
        @book.save
      end
      it "should not be reviewable" do
        expect(@book.reviewable?). to be false
#        #FIXME capybara is not seeing the New button
        # so I am testing the reviewable book controler code in
        # spec/controllers/review, which I don't like
#        visit book_reviews_path @book
#        find_button('New').click
#        expect(page).to have_text("is inactive and can't be reviewed")
      end
    end

  end

  describe 'Showing' do
    before(:each) do
      @author = FactoryGirl.create(:author)
      @book = FactoryGirl.create(:book, author_id: @author.id)
      @book.is_active = true
    end

    describe 'an unrated book' do
      it 'shows no ratings' do
        visit book_path @book
        expect(page).to have_text "No ratings"
      end
    end
  end


end

