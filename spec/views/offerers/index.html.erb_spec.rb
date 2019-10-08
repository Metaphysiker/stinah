require 'rails_helper'

RSpec.describe "offerers/index", type: :view do
  before(:each) do
    assign(:offerers, [
      Offerer.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :street => "Street",
        :city => "City",
        :plz => "Plz",
        :phone => "Phone",
        :email => "Email",
        :year => "Year",
        :experience => "MyText",
        :motivation => "MyText",
        :plans => "MyText"
      ),
      Offerer.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :street => "Street",
        :city => "City",
        :plz => "Plz",
        :phone => "Phone",
        :email => "Email",
        :year => "Year",
        :experience => "MyText",
        :motivation => "MyText",
        :plans => "MyText"
      )
    ])
  end

  it "renders a list of offerers" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Plz".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
