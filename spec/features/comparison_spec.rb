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

    @admin = admin
  end

  it "creates an offer and a request" do

    create_request

    create_offer

  end

  it "creates an offer and a request, edits them and compares them" do

    create_request

    create_offer

    login_with(@admin)

    species = I18n.t(Animal.species.sample, count: 1)
    race = Faker::Artist.name
    age = rand(0..50)
    min_age = age - 2
    max_age = age + 2
    size = rand(100..300)
    min_size = size - 2
    max_size = size + 2
    gender = I18n.t(Animal.genders[rand(2)], count: 1)
    castrated = ["Ja","Nein"].sample
    #find(:css, "#home_request_rideable").set(true)
    date = Date.today + rand(1..700).days
    date_from_then_on = date - rand(1..50).days

    visit(home_requests_path)

    find("a", :text => @home_request1_name).click

    find("a", :text => "Eintrag bearbeiten").click

    select_option("#home_request_date_of_killing_3i", date.day)
    select_option("#home_request_date_of_killing_2i", I18n.t("date.month_names")[date.month])
    select_option("#home_request_date_of_killing_1i", date.year)
    select_option("#home_request_species", species)
    fill_in "home_request_race", :with => race
    fill_in "home_request_age", :with => age
    fill_in "home_request_size", :with => size
    select_option("#home_request_gender", gender)
    select_option("#home_request_castrated", castrated)
    #find(:css, "#home_request_rideable").set(true)

    click_button "Tier-Abgabe aktualisieren"

    visit(home_offers_path)

    find("a", :text => @home_offer1_name).click

    find("a", :text => "Eintrag bearbeiten").click

    select_option("#home_offer_from_then_on_3i", date_from_then_on.day)
    select_option("#home_offer_from_then_on_2i", I18n.t("date.month_names")[date_from_then_on.month])
    select_option("#home_offer_from_then_on_1i", date_from_then_on.year)
    select_option("#home_offer_species", species)
    fill_in "home_offer_race", :with => race
    #find(:css, "#home_offer_age").set(false)
    fill_in "home_offer_min_age", :with => min_age
    fill_in "home_offer_max_age", :with => max_age
    #find(:css, "#home_offer_size").set(false)
    fill_in "home_offer_min_size", :with => min_size
    fill_in "home_offer_max_size", :with => max_size
    select_option("#home_offer_gender", gender)
    select_option("#home_offer_castrated", castrated)
    #find(:css, "#home_request_rideable").set(true)

    click_button "Platz-Angebot aktualisieren"

    find("a", :text => "1 Matches gefunden").click

    expect(page).to have_content(species)
    expect(page).to have_content(race)
    expect(page).to have_content(age)
    expect(page).to have_content(min_age)
    expect(page).to have_content(max_age)
    expect(page).to have_content(size)
    expect(page).to have_content(min_size)
    expect(page).to have_content(max_size)
    expect(page).to have_content(gender)
    expect(page).to have_content(castrated)
    expect(page).to have_content(I18n.l(date))
    expect(page).to have_content(I18n.l(date_from_then_on))

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

  race = Faker::Artist.name
  fill_in "home_request_race", :with => race

  age = rand(0..50)
  fill_in "home_request_age", :with => age

  size = rand(100..300)
  fill_in "home_request_size", :with => size

  color = "Braun"
  fill_in "home_request_color", :with => color

  gender = I18n.t(Animal.genders[rand(2)], count: 1)
  select_option("#home_request_gender", gender)

  castrated = ["Ja","Nein"].sample
  select_option("#home_request_castrated", castrated)

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

  login_with(@admin)

  visit(home_requests_path)

  expect(page).to have_content(firstname)
  expect(page).to have_content(lastname)

  @home_request1_name = firstname + " " + lastname

  find("a", :text => firstname).click

  expect(page).to have_content(firstname)
  expect(page).to have_content(lastname)
  expect(page).to have_content(street)
  expect(page).to have_content(city)
  expect(page).to have_content(plz)
  expect(page).to have_content(phone)
  expect(page).to have_content(email)

  expect(page).to have_content(messenger_firstname)
  expect(page).to have_content(messenger_lastname)
  expect(page).to have_content(messenger_street)
  expect(page).to have_content(messenger_city)
  expect(page).to have_content(messenger_plz)
  expect(page).to have_content(messenger_phone)
  expect(page).to have_content(messenger_email)

  expect(page).to have_content(I18n.l(date))

  expect(page).to have_content(species)
  expect(page).to have_content(race)
  expect(page).to have_content(features)
  expect(page).to have_content(age)
  expect(page).to have_content(size)
  expect(page).to have_content(color)
  expect(page).to have_content(castrated)
  expect(page).to have_content(gender)

  expect(page).to have_content(stable_owner_firstname)
  expect(page).to have_content(stable_owner_lastname)
  expect(page).to have_content(stable_owner_street)
  expect(page).to have_content(stable_owner_city)
  expect(page).to have_content(stable_owner_plz)
  expect(page).to have_content(stable_owner_phone)

  expect(page).to have_content(how_was_animal_held)
  expect(page).to have_content(how_was_animal_used)
  expect(page).to have_content(reason_of_request)
  expect(page).to have_content(is_animal_healthy)

  visit(home_requests_path)

  fill_in "search_inputs_search_term", :with => firstname + " " + lastname

  expect(page).to have_content(firstname)
  expect(page).to have_content(lastname)

  fill_in "search_inputs_search_term", :with => firstname + " " + lastname + " xyz"

  expect(page).to_not have_content(firstname)
  expect(page).to_not have_content(lastname)

  logout
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

  race = Faker::Artist.name
  fill_in "home_offer_race", :with => race

  find(:css, "#home_offer_age").set(false)
  min_age = rand(0..10)
  max_age = rand(10..50)
  fill_in "home_offer_min_age", :with => min_age
  fill_in "home_offer_max_age", :with => max_age

  find(:css, "#home_offer_size").set(false)
  min_size = rand(0..10)
  max_size = rand(10..50)
  fill_in "home_offer_min_size", :with => min_size
  fill_in "home_offer_max_size", :with => max_size

  gender = I18n.t(Animal.genders[rand(3)], count: 1)
  select_option("#home_offer_gender", gender)

  castrated = ["Ja","Nein", "egal"].sample
  select_option("#home_offer_castrated", castrated)

  find(:css, "#home_offer_rideable").set(true)

  stable = "Anderes"
  select_option("#home_offer_stable", stable)

  stable_alt = Faker::Lorem.paragraph
  fill_in "home_offer_stable_alt", :with => stable_alt

  date = Date.today + rand(1..700).days

  select_option("#home_offer_from_then_on_3i", date.day)
  select_option("#home_offer_from_then_on_2i", I18n.t("date.month_names")[date.month])
  select_option("#home_offer_from_then_on_1i", date.year)

  click_button "Tier hinzufügen"

  expect(page).to have_content("Tier wurde eingetragen!")

  visit(home_offers_path)

  expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")

  login_with(@admin)

  visit(home_offers_path)

  expect(page).to have_content(firstname)
  expect(page).to have_content(lastname)

  @home_offer1_name = firstname + " " + lastname

  find("a", :text => firstname).click

  expect(page).to have_content(firstname)
  expect(page).to have_content(lastname)
  expect(page).to have_content(street)
  expect(page).to have_content(city)
  expect(page).to have_content(plz)
  expect(page).to have_content(phone)
  expect(page).to have_content(email)
  expect(page).to have_content(year)
  expect(page).to have_content(offerer_experience)
  expect(page).to have_content(offerer_motivation)
  expect(page).to have_content(offerer_plans)

  expect(page).to have_content(species)
  expect(page).to have_content(race)
  expect(page).to have_content(min_age)
  expect(page).to have_content(max_age)
  expect(page).to have_content(min_size)
  expect(page).to have_content(max_size)

  expect(page).to have_content(gender)
  expect(page).to have_content(castrated)

  expect(page).to have_content(stable)
  expect(page).to have_content(stable_alt)

  expect(page).to have_content(I18n.l(date))

  visit(home_offers_path)

  fill_in "search_inputs_search_term", :with => firstname + " " + lastname

  expect(page).to have_content(firstname)
  expect(page).to have_content(lastname)

  fill_in "search_inputs_search_term", :with => firstname + " " + lastname + " xyz"

  expect(page).to_not have_content(firstname)
  expect(page).to_not have_content(lastname)

  logout
end

def login_with(user)
  visit "/users/sign_in"
  fill_in "user_login", :with => user.username
  fill_in "user_password", :with => "secret"
  click_button "Log in"

  #expect(page).to have_selector(".navbar-brand", :text => user.username)
end

def logout
  visit(root_path)
  find("a", :text => "Logout").click
  #expect(page).to have_selector(".navbar-brand", :text => user.username)
end

def select_option(css_selector, value)
  find(:css, css_selector).find(:option, value).select_option
end
