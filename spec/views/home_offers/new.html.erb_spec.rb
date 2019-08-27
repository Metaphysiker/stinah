require 'rails_helper'

RSpec.describe "home_offers/new", type: :view do
  before(:each) do
    assign(:home_offer, HomeOffer.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :street => "MyString",
      :plz => "MyString",
      :city => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :year => "MyString",
      :experience => "MyText",
      :motivation => "MyText",
      :plans => "MyText",
      :species => "MyString",
      :age => "MyString",
      :size => "MyString",
      :gender => "MyString",
      :castrated => "MyString",
      :stable => "MyString",
      :stable-alt => "MyString",
      :privacy-statement => false
    ))
  end

  it "renders new home_offer form" do
    render

    assert_select "form[action=?][method=?]", home_offers_path, "post" do

      assert_select "input[name=?]", "home_offer[firstname]"

      assert_select "input[name=?]", "home_offer[lastname]"

      assert_select "input[name=?]", "home_offer[street]"

      assert_select "input[name=?]", "home_offer[plz]"

      assert_select "input[name=?]", "home_offer[city]"

      assert_select "input[name=?]", "home_offer[phone]"

      assert_select "input[name=?]", "home_offer[email]"

      assert_select "input[name=?]", "home_offer[year]"

      assert_select "textarea[name=?]", "home_offer[experience]"

      assert_select "textarea[name=?]", "home_offer[motivation]"

      assert_select "textarea[name=?]", "home_offer[plans]"

      assert_select "input[name=?]", "home_offer[species]"

      assert_select "input[name=?]", "home_offer[age]"

      assert_select "input[name=?]", "home_offer[size]"

      assert_select "input[name=?]", "home_offer[gender]"

      assert_select "input[name=?]", "home_offer[castrated]"

      assert_select "input[name=?]", "home_offer[stable]"

      assert_select "input[name=?]", "home_offer[stable-alt]"

      assert_select "input[name=?]", "home_offer[privacy-statement]"
    end
  end
end
