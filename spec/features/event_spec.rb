require 'rails_helper'

RSpec.describe "event", :type => :feature do

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

  it "creates an event and expects it to see on the main page and in index" do
    visit(new_event_path)

    expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")

    login_with(@admin)

    visit(new_event_path)

    date_start = DateTime.now + rand(1..100).days
    date_end = date_start + 5.hours
    name = Faker::Book.title
    description = Faker::Lorem.paragraph

    select_option("#event_start_3i", date_start.day)
    select_option("#event_start_2i", I18n.t("date.month_names")[date_start.month])
    select_option("#event_start_1i", date_start.year)
    select_option("#event_start_4i", date_start.strftime('%H'))
    select_option("#event_start_5i", date_start.minute)

    select_option("#event_end_3i", date_end.day)
    select_option("#event_end_2i", I18n.t("date.month_names")[date_end.month])
    select_option("#event_end_1i", date_end.year)
    select_option("#event_end_4i", date_end.strftime('%H'))
    select_option("#event_end_5i", date_end.minute)

    fill_in "event_name", :with => name

    fill_in "event_description", :with => description

    click_button "Event erstellen"

    logout

    visit(root_path)

    expect(page).to have_content(name)

    visit(events_path)

    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(I18n.l(date_start))
    expect(page).to have_content(I18n.l(date_end))

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
