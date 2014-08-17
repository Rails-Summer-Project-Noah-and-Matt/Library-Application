require 'rails_helper'

RSpec.describe "authors/new", :type => :view do
  before(:each) do
    assign(:author, Author.new(
      :given_name => "MyString",
      :family_name => "MyString"
    ))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do

      assert_select "input#author_given_name[name=?]", "author[given_name]"

      assert_select "input#author_family_name[name=?]", "author[family_name]"
    end
  end
end
