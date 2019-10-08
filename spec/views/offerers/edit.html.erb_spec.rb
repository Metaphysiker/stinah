require 'rails_helper'

RSpec.describe "offerers/edit", type: :view do
  before(:each) do
    @offerer = assign(:offerer, Offerer.create!(
      :firstname => "MyString",
      :lastname => "MyString",
      :street => "MyString",
      :city => "MyString",
      :plz => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :year => "MyString",
      :experience => "MyText",
      :motivation => "MyText",
      :plans => "MyText"
    ))
  end

  it "renders the edit offerer form" do
    render

    assert_select "form[action=?][method=?]", offerer_path(@offerer), "post" do

      assert_select "input[name=?]", "offerer[firstname]"

      assert_select "input[name=?]", "offerer[lastname]"

      assert_select "input[name=?]", "offerer[street]"

      assert_select "input[name=?]", "offerer[city]"

      assert_select "input[name=?]", "offerer[plz]"

      assert_select "input[name=?]", "offerer[phone]"

      assert_select "input[name=?]", "offerer[email]"

      assert_select "input[name=?]", "offerer[year]"

      assert_select "textarea[name=?]", "offerer[experience]"

      assert_select "textarea[name=?]", "offerer[motivation]"

      assert_select "textarea[name=?]", "offerer[plans]"
    end
  end
end
