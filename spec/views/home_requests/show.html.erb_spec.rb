require 'rails_helper'

RSpec.describe "home_requests/show", type: :view do
  before(:each) do
    @home_request = assign(:home_request, HomeRequest.create!(
      :are_you_owner => false,
      :owner_firstname => "Owner Firstname",
      :owner_lastname => "Owner Lastname",
      :owner_street => "Owner Street",
      :owner_plz => "Owner Plz",
      :owner_city => "Owner City",
      :owner_phone => "Owner Phone",
      :owner_email => "Owner Email",
      :does_owner_agree_with_mediation => false,
      :do_you_own_authority_of_mediation => false,
      :messenger_firstname => "Messenger Firstname",
      :messenger_lastname => "Messenger Lastname",
      :messenger_street => "Messenger Street",
      :messenger_plz => "Messenger Plz",
      :messenger_city => "Messenger City",
      :messenger_phone => "Messenger Phone",
      :messenger_mail => "Messenger Mail",
      :killing_of_animal_intended => false,
      :killing_of_animal_scheduled => false,
      :species => "Species",
      :race => "Race",
      :age => "Age",
      :size => "Size",
      :color => "Color",
      :gender => "Gender",
      :castrated => "Castrated",
      :current_location => "Current Location",
      :features => "MyText",
      :stable_owner_firstname => "Stable Owner Firstname",
      :stable_owner_lastname => "Stable Owner Lastname",
      :stable_street => "Stable Street",
      :stable_plz => "Stable Plz",
      :stable_city => "Stable City",
      :stable_phone => "Stable Phone",
      :how_was_animal_held => "MyText",
      :how_was_animal_used => "MyText",
      :reason_of_request => "MyText",
      :is_animal_healthy => "MyText",
      :privacy_statement => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Owner Firstname/)
    expect(rendered).to match(/Owner Lastname/)
    expect(rendered).to match(/Owner Street/)
    expect(rendered).to match(/Owner Plz/)
    expect(rendered).to match(/Owner City/)
    expect(rendered).to match(/Owner Phone/)
    expect(rendered).to match(/Owner Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Messenger Firstname/)
    expect(rendered).to match(/Messenger Lastname/)
    expect(rendered).to match(/Messenger Street/)
    expect(rendered).to match(/Messenger Plz/)
    expect(rendered).to match(/Messenger City/)
    expect(rendered).to match(/Messenger Phone/)
    expect(rendered).to match(/Messenger Mail/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Species/)
    expect(rendered).to match(/Race/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Castrated/)
    expect(rendered).to match(/Current Location/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Stable Owner Firstname/)
    expect(rendered).to match(/Stable Owner Lastname/)
    expect(rendered).to match(/Stable Street/)
    expect(rendered).to match(/Stable Plz/)
    expect(rendered).to match(/Stable City/)
    expect(rendered).to match(/Stable Phone/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
