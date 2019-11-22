require 'rails_helper'

RSpec.describe "chicken_adoptions/index", type: :view do
  before(:each) do
    assign(:chicken_adoptions, [
      ChickenAdoption.create!(
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
      ),
      ChickenAdoption.create!(
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
      )
    ])
  end

  it "renders a list of chicken_adoptions" do
    render
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Plz".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Size Of Chicken Coop".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Adoption Of A Rooster Possible".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Privacy Statement".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
