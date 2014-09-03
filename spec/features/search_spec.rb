require 'rails_helper'

describe 'Search Features:' do

  before(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'Index' do
    before(:all) do
      @owner  = FactoryGirl.create(:user)
      @author = FactoryGirl.create(:author)
      @book_foo = FactoryGirl.create(:book, title: 'foo', owner_id: @owner.id, author_id: @author.id, approved: true) 
      @book_bar = FactoryGirl.create(:book, title: 'bar', owner_id: @owner.id, author_id: @author.id, approved: true) 
    end

    it 'shows some search fields' do
      visit books_path
      expect(page).to have_text "Average rating better than:"
      expect(page).to have_field "q_title_cont"
    end

    it 'searches' do
      visit books_path
      fill_in 'q_title_cont', with: @book_foo.title
      click_button 'Search'
      expect(page).to_not have_text "#{@book_bar.title}"
    end

  end

end




