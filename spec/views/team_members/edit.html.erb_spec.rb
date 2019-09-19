require 'rails_helper'

RSpec.describe "team_members/edit", type: :view do
  before(:each) do
    @team_member = assign(:team_member, TeamMember.create!(
      :firstname => "MyString",
      :lastname => "MyString",
      :description => "MyText",
      :phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit team_member form" do
    render

    assert_select "form[action=?][method=?]", team_member_path(@team_member), "post" do

      assert_select "input[name=?]", "team_member[firstname]"

      assert_select "input[name=?]", "team_member[lastname]"

      assert_select "textarea[name=?]", "team_member[description]"

      assert_select "input[name=?]", "team_member[phone]"

      assert_select "input[name=?]", "team_member[email]"
    end
  end
end
