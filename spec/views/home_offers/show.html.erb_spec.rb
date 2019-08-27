require 'rails_helper'

RSpec.describe "home_offers/show", type: :view do
  before(:each) do
    @home_offer = assign(:home_offer, HomeOffer.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Plz/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Species/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Castrated/)
    expect(rendered).to match(/Stable/)
    expect(rendered).to match(/Stable Alt/)
    expect(rendered).to match(/false/)
  end
end
