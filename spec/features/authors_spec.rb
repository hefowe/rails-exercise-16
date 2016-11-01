require 'rails_helper'

describe "Authors page", :type => :feature do

  it 'should render' do
    visit new_author_path
    expect(page).to have_text("New author")
  end

  it 'should have text input for first name, last name, and homepage' do
    visit new_author_path
    expect(page).to have_field("first_name")
  end
end