require 'rails_helper'

RSpec.describe "comparisons", :type => :feature do

  before(:each) do
    #requester = User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    #offerer = User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    #User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    admin = User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    Role.create(role: "admin")
    admin.roles << Role.find_by_role("admin")
    #login_with(admin)
  end

  it "creates an offer and a request" do

    create_request

    create_offer

  end

end

def create_request
  #visit(root_path)

  #find("#tiervermittlung-nav-button").click
  #save_screenshot("echo.png")
  #click_link('Ich will ein Tier abgeben')

  visit(new_home_request_path)

  firstname = Faker::Name.unique.first_name
  lastname = Faker::Name.unique.last_name
  street = Faker::Address.street_address
  city = Faker::Address.city
  plz = Faker::Address.zip_code
  phone = Faker::PhoneNumber.cell_phone
  email = Faker::Internet.email

  messenger_firstname = Faker::Name.unique.first_name
  messenger_lastname = Faker::Name.unique.last_name
  messenger_street = Faker::Address.street_address
  messenger_city = Faker::Address.city
  messenger_plz = Faker::Address.zip_code
  messenger_phone = Faker::PhoneNumber.cell_phone
  messenger_email = Faker::Internet.email


  fill_in "home_request_owner_firstname", :with => firstname
  fill_in "home_request_owner_lastname", :with => lastname
  fill_in "home_request_owner_street", :with => street
  fill_in "home_request_owner_city", :with => city
  fill_in "home_request_owner_plz", :with => plz
  fill_in "home_request_owner_phone", :with => phone
  fill_in "home_request_owner_email", :with => email

  find(:css, "#home_request_does_owner_agree_with_mediation").set(true)
  find(:css, "#home_request_do_you_own_authority_of_mediation").set(true)

  fill_in "home_request_messenger_firstname", :with => messenger_firstname
  fill_in "home_request_messenger_lastname", :with => messenger_lastname
  fill_in "home_request_messenger_street", :with => messenger_street
  fill_in "home_request_messenger_city", :with => messenger_city
  fill_in "home_request_messenger_plz", :with => messenger_plz
  fill_in "home_request_messenger_phone", :with => messenger_phone
  fill_in "home_request_messenger_mail", :with => messenger_email

  find(:css, "#home_request_killing_of_animal_intended").set(true)
  find(:css, "#home_request_killing_of_animal_scheduled").set(true)

  date = Date.today + rand(1..700).days

  select_option("#home_request_date_of_killing_3i", date.day)
  select_option("#home_request_date_of_killing_2i", I18n.t("date.month_names")[date.month])
  select_option("#home_request_date_of_killing_1i", date.year)

  species = I18n.t(Animal.species.sample, count: 1)
  select_option("#home_request_species", species)

  race = Faker::Movies::LordOfTheRings.character

  fill_in "home_request_race", :with => race

  fill_in "home_request_age", :with => rand(0..50)

  fill_in "home_request_size", :with => rand(100..300)

  fill_in "home_request_color", :with => "Braun"

  select_option("#home_request_gender", I18n.t(Animal.genders[rand(2)], count: 1))

  select_option("#home_request_castrated", ["Ja","Nein"].sample)

  find(:css, "#home_request_rideable").set(true)

  features = Faker::Lorem.paragraph
  fill_in "home_request_features", :with => features

  stable_owner_firstname = Faker::Name.unique.first_name
  stable_owner_lastname = Faker::Name.unique.last_name
  stable_owner_street = Faker::Address.street_address
  stable_owner_city = Faker::Address.city
  stable_owner_plz = Faker::Address.zip_code
  stable_owner_phone = Faker::PhoneNumber.cell_phone

  fill_in "home_request_stable_owner_firstname", :with => stable_owner_firstname
  fill_in "home_request_stable_owner_lastname", :with => stable_owner_lastname
  fill_in "home_request_stable_street", :with => stable_owner_street
  fill_in "home_request_stable_city", :with => stable_owner_city
  fill_in "home_request_stable_plz", :with => stable_owner_plz
  fill_in "home_request_stable_phone", :with => stable_owner_phone

  how_was_animal_held = Faker::Lorem.paragraph
  fill_in "home_request_how_was_animal_held", :with => how_was_animal_held

  how_was_animal_used = Faker::Lorem.paragraph
  fill_in "home_request_how_was_animal_used", :with => how_was_animal_used

  reason_of_request = Faker::Lorem.paragraph
  fill_in "home_request_reason_of_request", :with => reason_of_request

  is_animal_healthy = Faker::Lorem.paragraph
  fill_in "home_request_is_animal_healthy", :with => is_animal_healthy

  find(:css, "#home_request_privacy_statement").set(true)

  click_button "Tier-Abgabe erstellen"

  expect(page).to have_content("Bestätigung")

  visit(home_requests_path)

  expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")
end

def create_offer
  #visit(root_path)
  #find('.new-home-request-or-offer-nav').click
  #click_link('Ich biete einem Tier ein neues Zuhause')

  visit(process_to_create_home_offer_path)

  #sleep 5
  #save_screenshot("echo1.png")

  firstname = Faker::Name.unique.first_name
  lastname = Faker::Name.unique.last_name
  street = Faker::Address.street_address
  city = Faker::Address.city
  plz = Faker::Address.zip_code
  phone = Faker::PhoneNumber.cell_phone
  email = Faker::Internet.email
  year = rand(1950..2010)

  fill_in "offerer_firstname", :with => firstname
  fill_in "offerer_lastname", :with => lastname
  fill_in "offerer_street", :with => street
  fill_in "offerer_city", :with => city
  fill_in "offerer_plz", :with => plz
  fill_in "offerer_phone", :with => phone
  fill_in "offerer_email", :with => email
  fill_in "offerer_year", :with => year


  offerer_experience = Faker::Lorem.paragraph
  fill_in "offerer_experience", :with => offerer_experience

  offerer_motivation = Faker::Lorem.paragraph
  fill_in "offerer_motivation", :with => offerer_motivation

  offerer_plans = Faker::Lorem.paragraph
  fill_in "offerer_plans", :with => offerer_plans

  find(:css, "#offerer_privacy_statement").set(true)

  click_button "Weiter"

  #expect(page).to have_content("Bitte folgende Probleme beachten:")
  #save_screenshot("echo.png")
  expect(page).to have_content("Ich möchte folgende Tiere aufnehmen")

  species = I18n.t(Animal.species.sample, count: 1)
  select_option("#home_offer_species", species)

  race = Faker::Movies::LordOfTheRings.character

  fill_in "home_offer_race", :with => race

  find(:css, "#home_offer_age").set(false)
  fill_in "home_offer_min_age", :with => rand(0..10)
  fill_in "home_offer_max_age", :with => rand(10..50)

  find(:css, "#home_offer_size").set(false)
  fill_in "home_offer_min_size", :with => rand(0..10)
  fill_in "home_offer_max_size", :with => rand(10..50)

  select_option("#home_offer_gender", I18n.t(Animal.genders[rand(3)], count: 1))
  select_option("#home_offer_castrated", ["Ja","Nein", "egal"].sample)

  find(:css, "#home_offer_rideable").set(true)

  select_option("#home_offer_stable", Animal.stables.sample)

  date = Date.today + rand(1..700).days

  select_option("#home_offer_from_then_on_3i", date.day)
  select_option("#home_offer_from_then_on_2i", I18n.t("date.month_names")[date.month])
  select_option("#home_offer_from_then_on_1i", date.year)

  click_button "Tier hinzufügen"



end

def login_with(user)
  visit "/users/sign_in"
  fill_in "Login", :with => user.username
  fill_in "Passwort", :with => "secret"
  click_button "Log in"

  expect(page).to have_selector(".navbar-brand", :text => user.username)
end

def select_option(css_selector, value)
  find(:css, css_selector).find(:option, value).select_option
end
