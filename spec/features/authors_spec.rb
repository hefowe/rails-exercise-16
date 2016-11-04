require 'rails_helper'

describe "Authors page", :type => :feature do

  it 'should render' do
    visit new_author_path
    expect(page).to have_text("New author")
  end

  it 'should have text input for first name, last name, and homepage' do
    visit new_author_path
    expect(page).to have_field("author_first_name")
    expect(page).to have_field("author_last_name")
    expect(page).to have_field("author_homepage")
  end

  it 'should have a "Create Author" button' do
    visit new_author_path
    expect(page).to have_button("Create Author")
  end
end