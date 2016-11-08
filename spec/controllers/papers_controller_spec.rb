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
    paper = create(:paper)

    visit papers_path + "/" + paper.id.to_s

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

  it 'should show validation errors' do
    visit new_paper_path

    fill_in 'paper_title', with: ''
    fill_in 'paper_venue', with: 'Mind 49: 433-460'
    fill_in 'paper_year', with: '1950'
    submit_form

    expect(page).to have_text("Title can't be blank")
  end

  it 'should render edit route' do
    paper = create(:paper)

    visit edit_paper_path(id: paper.id)

    expect(page).to have_text("Editing paper")
  end

  it 'should save changes on edit paper page' do
    paper = create(:paper)

    visit edit_paper_path(id: paper.id)

    fill_in 'paper_venue', with: 'Mind 49'
    submit_form

    expect(page).to have_text("Venue: Mind 49")
  end

  it 'should link to edit paper page on the index route' do
    create(:paper)

    visit papers_path
    expect(page).to have_css("a", :text => "Edit")
  end

  it 'should have a link to delete an paper on the index route' do
    create(:paper)

    visit papers_path
    expect(page).to have_css("a", :text => "Destroy")
    click_link("Destroy")
  end

  it 'should list the authors' do
    paper = create(:paper)

    visit papers_path + "/" + paper.id.to_s
    expect(page).to have_text("Alan Turing")
  end

  it 'should allow to select 5 authors from 5 separate drop downs' do
    paper = create(:paper)

    visit edit_paper_path(id: paper.id)

    expect(page).to have_field("Author 1")
    expect(page).to have_field("Author 2")
    expect(page).to have_field("Author 3")
    expect(page).to have_field("Author 4")
    expect(page).to have_field("Author 5")
  end

  it 'should pre-select the actual authors in the drop downs' do
    paper = create(:paper)

    visit edit_paper_path(id: paper.id)

    expect(page).to have_select("Author 1", :selected => "Alan Turing")
  end

end
