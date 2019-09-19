require 'rails_helper'

RSpec.describe "team_members/show", type: :view do
  before(:each) do
    @team_member = assign(:team_member, TeamMember.create!(
      :firstname => "Firstname",
      :lastname => "Lastname",
      :description => "MyText",
      :phone => "Phone",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
  end
end
