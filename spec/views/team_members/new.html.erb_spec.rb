require 'rails_helper'

RSpec.describe "team_members/new", type: :view do
  before(:each) do
    assign(:team_member, TeamMember.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :description => "MyText",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new team_member form" do
    render

    assert_select "form[action=?][method=?]", team_members_path, "post" do

      assert_select "input[name=?]", "team_member[firstname]"

      assert_select "input[name=?]", "team_member[lastname]"

      assert_select "textarea[name=?]", "team_member[description]"

      assert_select "input[name=?]", "team_member[phone]"

      assert_select "input[name=?]", "team_member[email]"
    end
  end
end
