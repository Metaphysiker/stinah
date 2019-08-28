require 'rails_helper'

RSpec.describe "home_requests/edit", type: :view do
  before(:each) do
    @home_request = assign(:home_request, HomeRequest.create!(
      :are_you_owner => false,
      :owner_firstname => "MyString",
      :owner_lastname => "MyString",
      :owner_street => "MyString",
      :owner_plz => "MyString",
      :owner_city => "MyString",
      :owner_phone => "MyString",
      :owner_email => "MyString",
      :does_owner_agree_with_mediation => false,
      :do_you_own_authority_of_mediation => false,
      :messenger_firstname => "MyString",
      :messenger_lastname => "MyString",
      :messenger_street => "MyString",
      :messenger_plz => "MyString",
      :messenger_city => "MyString",
      :messenger_phone => "MyString",
      :messenger_mail => "MyString",
      :killing_of_animal_intended => false,
      :killing_of_animal_scheduled => false,
      :species => "MyString",
      :race => "MyString",
      :age => "MyString",
      :size => "MyString",
      :color => "MyString",
      :gender => "MyString",
      :castrated => "MyString",
      :current_location => "MyString",
      :features => "MyText",
      :stable_owner_firstname => "MyString",
      :stable_owner_lastname => "MyString",
      :stable_street => "MyString",
      :stable_plz => "MyString",
      :stable_city => "MyString",
      :stable_phone => "MyString",
      :how_was_animal_held => "MyText",
      :how_was_animal_used => "MyText",
      :reason_of_request => "MyText",
      :is_animal_healthy => "MyText",
      :privacy_statement => false
    ))
  end

  it "renders the edit home_request form" do
    render

    assert_select "form[action=?][method=?]", home_request_path(@home_request), "post" do

      assert_select "input[name=?]", "home_request[are_you_owner]"

      assert_select "input[name=?]", "home_request[owner_firstname]"

      assert_select "input[name=?]", "home_request[owner_lastname]"

      assert_select "input[name=?]", "home_request[owner_street]"

      assert_select "input[name=?]", "home_request[owner_plz]"

      assert_select "input[name=?]", "home_request[owner_city]"

      assert_select "input[name=?]", "home_request[owner_phone]"

      assert_select "input[name=?]", "home_request[owner_email]"

      assert_select "input[name=?]", "home_request[does_owner_agree_with_mediation]"

      assert_select "input[name=?]", "home_request[do_you_own_authority_of_mediation]"

      assert_select "input[name=?]", "home_request[messenger_firstname]"

      assert_select "input[name=?]", "home_request[messenger_lastname]"

      assert_select "input[name=?]", "home_request[messenger_street]"

      assert_select "input[name=?]", "home_request[messenger_plz]"

      assert_select "input[name=?]", "home_request[messenger_city]"

      assert_select "input[name=?]", "home_request[messenger_phone]"

      assert_select "input[name=?]", "home_request[messenger_mail]"

      assert_select "input[name=?]", "home_request[killing_of_animal_intended]"

      assert_select "input[name=?]", "home_request[killing_of_animal_scheduled]"

      assert_select "input[name=?]", "home_request[species]"

      assert_select "input[name=?]", "home_request[race]"

      assert_select "input[name=?]", "home_request[age]"

      assert_select "input[name=?]", "home_request[size]"

      assert_select "input[name=?]", "home_request[color]"

      assert_select "input[name=?]", "home_request[gender]"

      assert_select "input[name=?]", "home_request[castrated]"

      assert_select "input[name=?]", "home_request[current_location]"

      assert_select "textarea[name=?]", "home_request[features]"

      assert_select "input[name=?]", "home_request[stable_owner_firstname]"

      assert_select "input[name=?]", "home_request[stable_owner_lastname]"

      assert_select "input[name=?]", "home_request[stable_street]"

      assert_select "input[name=?]", "home_request[stable_plz]"

      assert_select "input[name=?]", "home_request[stable_city]"

      assert_select "input[name=?]", "home_request[stable_phone]"

      assert_select "textarea[name=?]", "home_request[how_was_animal_held]"

      assert_select "textarea[name=?]", "home_request[how_was_animal_used]"

      assert_select "textarea[name=?]", "home_request[reason_of_request]"

      assert_select "textarea[name=?]", "home_request[is_animal_healthy]"

      assert_select "input[name=?]", "home_request[privacy_statement]"
    end
  end
end
