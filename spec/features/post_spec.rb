require 'rails_helper'

RSpec.describe "post", :type => :feature do

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

  it "creates a post and expects it to see on the main page and in index" do
    visit(new_post_path)

    expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")

    login_with(@admin)

    visit(new_post_path)

    title = Faker::Book.title
    content = Faker::Lorem.sentence(word_count: 20)

    fill_in "post_title", :with => title
    find('#post_content').click.set(content)

    click_button "Eintrag erstellen"

    logout

    visit(root_path)

    expect(page).to have_content_i(title)
    #expect(page).to have_content(content)

    visit(posts_path)

    expect(page).to have_content_i(title)
    expect(page).to have_content(content)

  end

  it "creates a post for save the chicken and expects it to see on the main page, in index and on the save the chicken site" do
    visit(new_post_path)

    expect(page).to have_content("Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können.")

    login_with(@admin)

    visit(new_post_path)

    title = Faker::Book.title
    content = Faker::Lorem.sentence(word_count: 100)
    category = I18n.t("save_the_chicken") #I18n.t(Animal.species.sample, count: 1)
    select_option("#post_category", category)

    fill_in "post_title", :with => title
    find('#post_content').click.set(content)

    click_button "Eintrag erstellen"

    logout

    visit(root_path)

    expect(page).to have_content_i(title)
    #expect(page).to have_content(content)

    visit(posts_path)

    expect(page).to have_content_i(title)
    #expect(page).to have_content(content)

    visit(save_the_chicken_path)
    expect(page).to have_content_i(title)
    save_screenshot("content.png")
    expect(page).to have_content(content)
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
