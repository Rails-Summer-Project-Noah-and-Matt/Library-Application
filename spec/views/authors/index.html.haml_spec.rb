require 'rails_helper'

RSpec.describe "authors/index", :type => :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :given_name => "Given Name",
        :family_name => "Family Name"
      ),
      Author.create!(
        :given_name => "Given Name",
        :family_name => "Family Name"
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => "Given Name".to_s, :count => 2
    assert_select "tr>td", :text => "Family Name".to_s, :count => 2
  end
end
