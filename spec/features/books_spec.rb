require 'spec_helper'

describe 'Book Features' do

  DatabaseCleaner.clean_with(:truncation)

  let(:user)   { FactoryGirl.create(:user) }
  let(:author) { FactoryGirl.create(:author) }
  let(:book)   { FactoryGirl.create(:book, owner_id: user) }
  let(:review) { FactoryGirl.create(:review, book: book) }

  describe 'deleting' do

    describe 'a book without reviews' do
      before(:each) do
        @book = FactoryGirl.create(:book)
      end
      it "should be deletable" do
        expect(@book.destroyable?).to be true
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

  describe 'reviewing' do

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
        @book = FactoryGirl.create(:book)
        @book.is_active = false
      end
      it "should not be reviewable" do
        expect(@book.reviewable?). to be false
      end
    end

  end

end

