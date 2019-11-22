require 'rails_helper'

RSpec.describe "chicken_adoptions/new", type: :view do
  before(:each) do
    assign(:chicken_adoption, ChickenAdoption.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :street => "MyString",
      :plz => "MyString",
      :city => "MyString",
      :phone => "MyString",
      :number_of_chickens_for_adoption => 1,
      :number_of_chickens_currently => 1,
      :description_of_home => "MyText",
      :size_of_chicken_coop => "MyString",
      :size_of_outdoor_area => 1,
      :adoption_of_a_rooster_possible => "MyString",
      :acceptance_statement => false,
      :privacy_statement => "MyString",
      :message => "MyText"
    ))
  end

  it "renders new chicken_adoption form" do
    render

    assert_select "form[action=?][method=?]", chicken_adoptions_path, "post" do

      assert_select "input[name=?]", "chicken_adoption[firstname]"

      assert_select "input[name=?]", "chicken_adoption[lastname]"

      assert_select "input[name=?]", "chicken_adoption[street]"

      assert_select "input[name=?]", "chicken_adoption[plz]"

      assert_select "input[name=?]", "chicken_adoption[city]"

      assert_select "input[name=?]", "chicken_adoption[phone]"

      assert_select "input[name=?]", "chicken_adoption[number_of_chickens_for_adoption]"

      assert_select "input[name=?]", "chicken_adoption[number_of_chickens_currently]"

      assert_select "textarea[name=?]", "chicken_adoption[description_of_home]"

      assert_select "input[name=?]", "chicken_adoption[size_of_chicken_coop]"

      assert_select "input[name=?]", "chicken_adoption[size_of_outdoor_area]"

      assert_select "input[name=?]", "chicken_adoption[adoption_of_a_rooster_possible]"

      assert_select "input[name=?]", "chicken_adoption[acceptance_statement]"

      assert_select "input[name=?]", "chicken_adoption[privacy_statement]"

      assert_select "textarea[name=?]", "chicken_adoption[message]"
    end
  end
end
