require 'rails_helper'

RSpec.describe "newsletter", :type => :feature do

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

  it "it leaves the form empty, adds invalid inputs and expects an error" do
    pending
    visit(root_path)

    expect(page).to have_content("Abonniere unseren Newsletter!")

    fill_in "newsletter_email", :with => ""

    click_button "Newsletter abonnieren!"

    expect(page).to have_content("Bitte folgende Probleme beachten")

    visit(root_path)

    expect(page).to have_content("Abonniere unseren Newsletter!")

    fill_in "newsletter_email", :with => "abcdefgh"

    click_button "Newsletter abonnieren!"

    expect(page).to have_content("Bitte folgende Probleme beachten")


  end

  it "it adds email address and expects a response" do
    pending
    visit(root_path)

    expect(page).to have_content("Abonniere unseren Newsletter!")

    email = Faker::Internet.email

    fill_in "newsletter_email", :with => email

    click_button "Newsletter abonnieren!"

    expect(page).to have_content("Newsletter wurde abonniert!")

    visit(newsletters_path)

    expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")

    login_with(@admin)

    visit(newsletters_path)

    expect(page).to have_content(email)
  end

end

#email = open_email('test@example.com')
#expect(email.subject).to eq('SUBJECT')
#expect(email.to).to eq(['test@example.com'])

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
