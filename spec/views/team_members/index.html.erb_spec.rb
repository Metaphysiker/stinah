require 'rails_helper'

RSpec.describe "team_members/index", type: :view do
  before(:each) do
    assign(:team_members, [
      TeamMember.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :description => "MyText",
        :phone => "Phone",
        :email => "Email"
      ),
      TeamMember.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :description => "MyText",
        :phone => "Phone",
        :email => "Email"
      )
    ])
  end

  it "renders a list of team_members" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
