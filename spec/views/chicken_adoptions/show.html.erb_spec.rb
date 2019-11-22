require 'rails_helper'

RSpec.describe "chicken_adoptions/show", type: :view do
  before(:each) do
    @chicken_adoption = assign(:chicken_adoption, ChickenAdoption.create!(
      :firstname => "Firstname",
      :lastname => "Lastname",
      :street => "Street",
      :plz => "Plz",
      :city => "City",
      :phone => "Phone",
      :number_of_chickens_for_adoption => 2,
      :number_of_chickens_currently => 3,
      :description_of_home => "MyText",
      :size_of_chicken_coop => "Size Of Chicken Coop",
      :size_of_outdoor_area => 4,
      :adoption_of_a_rooster_possible => "Adoption Of A Rooster Possible",
      :acceptance_statement => false,
      :privacy_statement => "Privacy Statement",
      :message => "MyText"
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
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Size Of Chicken Coop/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Adoption Of A Rooster Possible/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Privacy Statement/)
    expect(rendered).to match(/MyText/)
  end
end
