require 'rails_helper'

RSpec.describe "animals/edit", type: :view do
  before(:each) do
    @animal = assign(:animal, Animal.create!(
      :name => "MyString",
      :description => "MyText",
      :species => "MyString",
      :race => "MyString"
    ))
  end

  it "renders the edit animal form" do
    render

    assert_select "form[action=?][method=?]", animal_path(@animal), "post" do

      assert_select "input[name=?]", "animal[name]"

      assert_select "textarea[name=?]", "animal[description]"

      assert_select "input[name=?]", "animal[species]"

      assert_select "input[name=?]", "animal[race]"
    end
  end
end
