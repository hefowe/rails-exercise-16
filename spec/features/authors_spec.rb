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

  it 'should have a "Create Author" button' do
    visit new_author_path

    fill_in 'author_first_name', with: 'Alan'
    fill_in 'author_last_name', with: 'Turing'
    fill_in 'author_homepage', with: 'http://wikipedia.org/Alan_Turing'
    submit_form

    expect(Author.where(first_name: "Alan", last_name: "Turing")).to exist
  end
end