require 'rails_helper'

RSpec.describe "chicken_adoption", :type => :feature do

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


  it "it completes the form and expects a message" do
    visit(save_the_chicken_contact_path)

    firstname = Faker::Name.unique.first_name
    lastname = Faker::Name.unique.last_name
    street = Faker::Address.street_address
    city = Faker::Address.city
    plz = Faker::Address.zip_code
    phone = Faker::PhoneNumber.cell_phone
    email = Faker::Internet.email
    year = rand(1950..2010)
    number_of_chickens_for_adoption = rand(2..150)
    number_of_chickens_currently = rand(2..150)
    description_of_home = Faker::Lorem.paragraph
    size_of_chicken_coop = "5m x 4m"
    size_of_outdoor_area = rand(10..100)
    adoption_of_a_rooster_possible = ["Ja","Nein"].sample
    message = Faker::Lorem.paragraph


    fill_in "chicken_adoption_firstname", :with => firstname
    fill_in "chicken_adoption_lastname", :with => lastname
    fill_in "chicken_adoption_street", :with => street
    fill_in "chicken_adoption_city", :with => city
    fill_in "chicken_adoption_plz", :with => plz
    fill_in "chicken_adoption_phone", :with => phone
    fill_in "chicken_adoption_email", :with => email
    fill_in "chicken_adoption_number_of_chickens_for_adoption", :with => number_of_chickens_for_adoption
    fill_in "chicken_adoption_number_of_chickens_currently", :with => number_of_chickens_currently
    fill_in "chicken_adoption_description_of_home", :with => description_of_home
    fill_in "chicken_adoption_size_of_chicken_coop", :with => size_of_chicken_coop
    fill_in "chicken_adoption_size_of_outdoor_area", :with => size_of_outdoor_area
    select_option("#chicken_adoption_adoption_of_a_rooster_possible", adoption_of_a_rooster_possible)
    find(:css, "#chicken_adoption_acceptance_statement").set(true)
    fill_in "chicken_adoption_message", :with => message
    find(:css, "#chicken_adoption_privacy_statement").set(true)

    click_button "Formular einreichen"

    expect(page).to have_content("Formular wurde eingereicht!")

    visit(chicken_adoptions_path)

    expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")

    login_with(@admin)

    visit(chicken_adoptions_path)

    find("a", :text => firstname).click

    expect(page).to have_content(firstname)
    expect(page).to have_content(lastname)

    expect(page).to have_content(firstname)
    expect(page).to have_content(lastname)
    expect(page).to have_content(street)
    expect(page).to have_content(city)
    expect(page).to have_content(plz)
    expect(page).to have_content(phone)
    expect(page).to have_content(email)

    visit(chicken_adoptions_path)

    fill_in "search_inputs_search_term", :with => firstname + " " + lastname

    expect(page).to have_content(firstname)
    expect(page).to have_content(lastname)

    fill_in "search_inputs_search_term", :with => firstname + " " + lastname + " xyz"

    expect(page).to_not have_content(firstname)
    expect(page).to_not have_content(lastname)

  end

    it "it leaves form empty and expects an error" do

      visit(save_the_chicken_contact_path)

      click_button "Formular einreichen"

      expect(page).to have_content("Bitte folgende Probleme beachten:")
    end
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
