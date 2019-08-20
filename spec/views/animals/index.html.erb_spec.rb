require 'rails_helper'

RSpec.describe "animals/index", type: :view do
  before(:each) do
    assign(:animals, [
      Animal.create!(
        :name => "Name",
        :description => "MyText",
        :species => "Species",
        :race => "Race"
      ),
      Animal.create!(
        :name => "Name",
        :description => "MyText",
        :species => "Species",
        :race => "Race"
      )
    ])
  end

  it "renders a list of animals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Species".to_s, :count => 2
    assert_select "tr>td", :text => "Race".to_s, :count => 2
  end
end
