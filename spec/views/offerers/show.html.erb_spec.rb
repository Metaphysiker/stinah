require 'rails_helper'

RSpec.describe "offerers/show", type: :view do
  before(:each) do
    @offerer = assign(:offerer, Offerer.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Plz/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
