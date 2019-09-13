require 'rails_helper'

RSpec.describe "comparisons", :type => :feature do

  before(:each) do
    #requester = User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    #offerer = User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    #User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    admin = User.create!(:username => Faker::Internet.username, :email => Faker::Internet.email, :password => "secret")
    Role.create(role: "admin")
    admin.roles << Role.find_by_role("admin")
    #login_with(first_user)
  end

  it "creates an offer and a request" do

    create_request

  end

end

def create_request
  visit(root_path)
  #find('.new-home-request-or-offer-nav').click
  click_link('Ich suche ein neues Zuhause für mein Tier')

  fill_in "home_request_owner_firstname", :with => Faker::Name.first_name
  fill_in "home_request_owner_lastname", :with => Faker::Name.last_name
  fill_in "home_request_owner_street", :with => Faker::Address.street_address
  fill_in "home_request_owner_city", :with => Faker::Address.city
  fill_in "home_request_owner_plz", :with => Faker::Address.zip_code
  fill_in "home_request_owner_phone", :with => Faker::PhoneNumber.cell_phone #=> "(186)285-7925"
  fill_in "home_request_owner_email", :with => Faker::Internet.email
  find(:css, "#home_request_does_owner_agree_with_mediation").set(true)
  find(:css, "#home_request_do_you_own_authority_of_mediation").set(true)
  fill_in "home_request_messenger_firstname", :with => Faker::Name.first_name
  fill_in "home_request_messenger_lastname", :with => Faker::Name.last_name
  fill_in "home_request_messenger_street", :with => Faker::Address.street_address
  fill_in "home_request_messenger_city", :with => Faker::Address.city
  fill_in "home_request_messenger_plz", :with => Faker::Address.zip_code
  fill_in "home_request_messenger_phone", :with => Faker::PhoneNumber.cell_phone #=> "(186)285-7925"
  fill_in "home_request_messenger_mail", :with => Faker::Internet.email

  #save_screenshot("request.png")
end

def create_offer

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
