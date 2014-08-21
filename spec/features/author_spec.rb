require 'spec_helper'

describe 'Author Features' do

  DatabaseCleaner.clean_with(:truncation)

  let(:author) { FactoryGirl.create(:author) }
  let(:book)   { FactoryGirl.create(:book, owner_id: user) }

  describe 'deleting' do

    describe 'an author without books' do
      before(:each) do
        @author = FactoryGirl.create(:author)
      end
      it "should be deletable" do
        expect { @author.delete }.to change(Author, :count).by(-1)
      end
    end

    describe 'an author with books' do
      before(:each) do
        @author = FactoryGirl.create(:author)
        @book   = FactoryGirl.create(:book, author: @author)
      end
      it "should not be deletable" do
        expect { @author.delete }.to_not change(Author, :count)
      end
    end

  end

end
