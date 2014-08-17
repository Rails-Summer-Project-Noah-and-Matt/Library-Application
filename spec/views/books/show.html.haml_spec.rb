require 'rails_helper'

RSpec.describe "books/show", :type => :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      :given_name => "Douglas",
      :family_name => "Adams"
    ))
    @book = assign(:book, Book.create!(
      :title => "Title",
      :author => @author,
      :is_active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
  end
end
