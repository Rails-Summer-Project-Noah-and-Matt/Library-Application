require 'rails_helper'

RSpec.describe Author, :type => :model do
  before(:example) do
    @author = Author.create(given_name: "Joe", family_name: "Smith")
    @book = Book.create(title: "Joe's Book", is_active: true, author_id: 1)
  end

  it "should refuse to destroy an author with books" do
    expect { @author.destroy }.to_not change(Book, :count)
  end
end
