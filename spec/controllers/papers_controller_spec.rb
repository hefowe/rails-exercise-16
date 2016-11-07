require 'rails_helper'

describe PapersController, :type => :feature do
  it 'should render' do
    visit new_paper_path
    expect(page).to have_text("New paper")
  end
end
