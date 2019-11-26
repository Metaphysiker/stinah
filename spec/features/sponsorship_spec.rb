require 'rails_helper'

RSpec.describe "sponsorship", :type => :feature do

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

  it "it looks up an animal and wants to sponsor an animal" do

    name = Faker::Name.unique.first_name
    description = Faker::Lorem.paragraph
    species = Animal.species.sample

    Animal.create(
      name: name,
      description: description,
      species: species
    )

    visit(animals_path)

    expect(page).to have_content(name)

    sponsorship_button_name = "Pate von " + name + " werden!"

    expect(page).to have_content(sponsorship_button_name)

    click_button sponsorship_button_name

    donation = rand(30...900)
    firstname = Faker::Name.unique.first_name
    lastname = Faker::Name.unique.last_name
    email = Faker::Internet.email
    fill_in "sponsorship_donation", :with => donation
    fill_in "sponsorship_firstname", :with => firstname
    fill_in "sponsorship_lastname", :with => lastname
    fill_in "sponsorship_email", :with => email
    find(:css, "#sponsorship_public").set(true)

    click_button "Patenschaft erstellen"

    expect(page).to have_content("Vielen Dank für Ihre Patenschaft!")
    expect(page).to have_content("PC-Konto: 90-153438-8")
    expect(page).to have_content(donation)

    visit(sponsorships_path)

    expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")

    login_with(@admin)

    visit(sponsorships_path)
    expect(page).to have_content(donation)
    expect(page).to have_content(firstname)
    expect(page).to have_content(lastname)
    expect(page).to have_content(email)

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
