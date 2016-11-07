require 'rails_helper'

describe AuthorsController, :type => :feature do

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

  it 'should save the author' do
    visit new_author_path

    fill_in 'author_first_name', with: 'Alan'
    fill_in 'author_last_name', with: 'Turing'
    fill_in 'author_homepage', with: 'http://wikipedia.org/Alan_Turing'
    submit_form

    expect(Author.where(first_name: "Alan", last_name: "Turing")).to exist
  end

  it 'should display author details' do
    author = create(:author)

    visit authors_path + "/" + author.id.to_s

    expect(page).to have_text("First name: Alan")
    expect(page).to have_text("Last name: Turing")
    expect(page).to have_text("Homepage: http://wikipedia.org/Alan_Turing")
  end

  it 'should render index route' do
    visit authors_path
    expect(page).to have_text("Listing authors")
  end

  it 'should link to the new author page on the index route' do
    visit authors_path
    expect(page).to have_css("a", :text => "Add author")
  end

  it 'should link to author page on the index route' do
    create(:author)

    visit authors_path
    expect(page).to have_css("a", :text => "Show")
  end

  it 'should show validation errors' do
    visit new_author_path

    fill_in 'author_first_name', with: 'Alan'
    fill_in 'author_last_name', with: ''
    fill_in 'author_homepage', with: 'http://wikipedia.org/Alan_Turing'
    submit_form

    expect(page).to have_text("Last name can't be blank")
  end

  it 'should render edit route' do
    author = create(:author)

    visit edit_author_path(id: author.id)

    expect(page).to have_text("Editing author")
  end

  it 'should save changes on edit author page' do
    author = create(:author)

    visit edit_author_path(id: author.id)

    fill_in 'author_first_name', with: 'Alan Mathison'
    submit_form

    expect(page).to have_text("First name: Alan Mathison")
  end

  it 'should link to edit author page on the index route' do
    create(:author)

    visit authors_path
    expect(page).to have_css("a", :text => "Edit")
  end

  it 'should have a link to delete an author on the index route' do
    create(:author)

    visit authors_path
    expect(page).to have_css("a", :text => "Destroy")
    click_link("Destroy")
  end

end