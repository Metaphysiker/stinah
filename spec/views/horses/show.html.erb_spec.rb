require 'rails_helper'

RSpec.describe "horses/show", type: :view do
  before(:each) do
    @horse = assign(:horse, Horse.create!(
      :name => "Name",
      :race => "Race",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Race/)
    expect(rendered).to match(/MyText/)
  end
end
