require 'rails_helper'

RSpec.describe "authors/edit", :type => :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      :given_name => "MyString",
      :family_name => "MyString"
    ))
  end

  it "renders the edit author form" do
    render

    assert_select "form[action=?][method=?]", author_path(@author), "post" do

      assert_select "input#author_given_name[name=?]", "author[given_name]"

      assert_select "input#author_family_name[name=?]", "author[family_name]"
    end
  end
end
