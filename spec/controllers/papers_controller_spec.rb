require 'rails_helper'

describe PapersController, :type => :feature do
  it 'should render' do
    visit new_paper_path
    expect(page).to have_text("New paper")
  end

  it 'should have text input for title, venue, and year' do
    visit new_paper_path
    expect(page).to have_field("paper_title")
    expect(page).to have_field("paper_venue")
    expect(page).to have_field("paper_year")
  end

  it 'should have a submit button' do
    visit new_paper_path
    expect(page).to have_button("Create Paper")
  end

  it 'should display paper details' do
    create(:paper)

    visit papers_path + "/1"

    expect(page).to have_text("Title: COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Venue: Mind 49: 433-460")
    expect(page).to have_text("Year: 1950")
  end

  it 'should render index route' do
    visit papers_path
    expect(page).to have_text("Listing papers")
  end

  it 'should link to the new paper page on the index route' do
    visit papers_path
    expect(page).to have_css("a", :text => "Add paper")
  end

  it 'should link to paper page on the index route' do
    create(:paper)

    visit papers_path
    expect(page).to have_css("a", :text => "Show")
  end

end
