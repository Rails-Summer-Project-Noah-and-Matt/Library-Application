require 'rails_helper'

describe 'Author Features' do

  DatabaseCleaner.clean_with(:truncation)

  let(:author) { FactoryGirl.create(:author) }
  let(:book)   { FactoryGirl.create(:book, owner_id: user) }

  describe 'Index' do
    before(:all) do
      @author = FactoryGirl.create(:author)
    end

    it 'should list an author' do
      visit authors_path
      expect(page).to have_text(@author.sortable_name)
    end

  end

  describe 'deleting' do

    describe 'an author without books' do
      before(:each) do
        @author = FactoryGirl.create(:author)
      end
      it "should be deletable" do
        expect(@author.destroyable?).to be true
      end
    end

    describe 'an author with books' do
      before(:each) do
        @author = FactoryGirl.create(:author)
        @book   = FactoryGirl.create(:book, author: @author)
      end
      it "should not be deletable" do
        expect(@author.destroyable?).to be false
      end
    end

  end

end
