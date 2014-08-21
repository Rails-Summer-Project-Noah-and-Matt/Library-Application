require 'spec_helper'

describe 'Book Features' do

  DatabaseCleaner.clean_with(:truncation)

  let(:user) { FactoryGirl.create(:user) }
  let(:author) { FactoryGirl.create(:author) }
  let(:book) { FactoryGirl.create(:book, owner_id: user) }
  let(:review) { FactoryGirl.create(:review, book: book) }

  describe 'deleting' do

    describe 'a book without reviews' do
      before(:each) do
        @book = FactoryGirl.create(:book)
      end
      it "should be deletable" do
        expect { @book.delete }.to change(Book, :count).by(-1)
      end
    end

    describe 'a book with reviews' do
      before(:each) do
        @book = FactoryGirl.create(:book)
        @review = FactoryGirl.create(:review, book: @book)
      end
      it "should not be deletable" do
        expect { @book.delete }.to_not change(Book, :count)
      end
    end

  end

end

