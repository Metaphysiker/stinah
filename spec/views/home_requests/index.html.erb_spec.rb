require 'rails_helper'

RSpec.describe "home_requests/index", type: :view do
  before(:each) do
    assign(:home_requests, [
      HomeRequest.create!(
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
      ),
      HomeRequest.create!(
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
      )
    ])
  end

  it "renders a list of home_requests" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Owner Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Street".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Plz".to_s, :count => 2
    assert_select "tr>td", :text => "Owner City".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Messenger Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Messenger Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Messenger Street".to_s, :count => 2
    assert_select "tr>td", :text => "Messenger Plz".to_s, :count => 2
    assert_select "tr>td", :text => "Messenger City".to_s, :count => 2
    assert_select "tr>td", :text => "Messenger Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Messenger Mail".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Species".to_s, :count => 2
    assert_select "tr>td", :text => "Race".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Castrated".to_s, :count => 2
    assert_select "tr>td", :text => "Current Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Stable Owner Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Stable Owner Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Stable Street".to_s, :count => 2
    assert_select "tr>td", :text => "Stable Plz".to_s, :count => 2
    assert_select "tr>td", :text => "Stable City".to_s, :count => 2
    assert_select "tr>td", :text => "Stable Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
