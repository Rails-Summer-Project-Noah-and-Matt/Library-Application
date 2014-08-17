require 'rails_helper'

RSpec.describe "authors/show", :type => :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      :given_name => "Given Name",
      :family_name => "Family Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Given Name/)
    expect(rendered).to match(/Family Name/)
  end
end
