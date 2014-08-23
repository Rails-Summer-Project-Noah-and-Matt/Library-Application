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
      @owner = FactoryGirl.create(:user)
      @author = FactoryGirl.create(:author)
      @books = []
      3.times{ @books << FactoryGirl.create(:book, owner_id: @owner.id, author_id: @author.id) }
    end

    it 'should list the book titles' do
      visit books_path
      @books.each do |book|
        expect(page).to have_content(book.title)
      end
    end

  end

  describe 'Deleting' do

    describe 'a book without reviews' do
      before(:each) do
        @book = FactoryGirl.create(:book)
      end
      it "should be deletable" do
        expect(@book.destroyable?).to be true
      end
    end

#    describe 'a book I own' do
#      before(:each) do
#        @author = FactoryGirl.create(:author)
#        @owner  = FactoryGirl.create(:user)
#        @book   = FactoryGirl.create(:book, owner_id: @owner, author_id: @author)
#        #sign_in @owner
#      end
#      it "I can destroy" do
#        @book.save
#        visit book_path @book
#      end
#    end

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

  describe 'Reviews' do

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

end

