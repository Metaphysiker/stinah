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
