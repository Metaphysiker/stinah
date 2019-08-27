require 'rails_helper'

RSpec.describe "home_offers/index", type: :view do
  before(:each) do
    assign(:home_offers, [
      HomeOffer.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :street => "Street",
        :plz => "Plz",
        :city => "City",
        :phone => "Phone",
        :email => "Email",
        :year => "Year",
        :experience => "MyText",
        :motivation => "MyText",
        :plans => "MyText",
        :species => "Species",
        :age => "Age",
        :size => "Size",
        :gender => "Gender",
        :castrated => "Castrated",
        :stable => "Stable",
        :stable-alt => "Stable Alt",
        :privacy-statement => false
      ),
      HomeOffer.create!(
        :firstname => "Firstname",
        :lastname => "Lastname",
        :street => "Street",
        :plz => "Plz",
        :city => "City",
        :phone => "Phone",
        :email => "Email",
        :year => "Year",
        :experience => "MyText",
        :motivation => "MyText",
        :plans => "MyText",
        :species => "Species",
        :age => "Age",
        :size => "Size",
        :gender => "Gender",
        :castrated => "Castrated",
        :stable => "Stable",
        :stable-alt => "Stable Alt",
        :privacy-statement => false
      )
    ])
  end

  it "renders a list of home_offers" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Plz".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Species".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Castrated".to_s, :count => 2
    assert_select "tr>td", :text => "Stable".to_s, :count => 2
    assert_select "tr>td", :text => "Stable Alt".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
