require 'rails_helper'

RSpec.describe "horses/new", type: :view do
  before(:each) do
    assign(:horse, Horse.new(
      :name => "MyString",
      :race => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new horse form" do
    render

    assert_select "form[action=?][method=?]", horses_path, "post" do

      assert_select "input[name=?]", "horse[name]"

      assert_select "input[name=?]", "horse[race]"

      assert_select "textarea[name=?]", "horse[description]"
    end
  end
end
