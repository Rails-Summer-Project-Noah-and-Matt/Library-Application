require 'rails_helper'

RSpec.describe "books/edit", :type => :view do
  before(:all) do 
    User.destroy_all
    @user = FactoryGirl.create(:user)
  end

  before(:each) do
  
    @book = assign(:book, Book.create!(
      :title => "MyString",
      :is_active => false,
      :owner_id => @user.id
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_is_active[name=?]", "book[is_active]"
    end
  end
end
