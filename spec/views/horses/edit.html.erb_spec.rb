require 'rails_helper'

RSpec.describe "horses/edit", type: :view do
  before(:each) do
    @horse = assign(:horse, Horse.create!(
      :name => "MyString",
      :race => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit horse form" do
    render

    assert_select "form[action=?][method=?]", horse_path(@horse), "post" do

      assert_select "input[name=?]", "horse[name]"

      assert_select "input[name=?]", "horse[race]"

      assert_select "textarea[name=?]", "horse[description]"
    end
  end
end
