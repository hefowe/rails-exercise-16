require 'rails_helper'

describe Paper, :type => :feature do

  it 'should have title, venue, and year' do
    paper = Paper.new

    paper.title = "COMPUTING MACHINERY AND INTELLIGENCE"
    paper.venue = "Mind 49: 433-460"
    paper.year = "1950"

    expect(paper.title).to eq "COMPUTING MACHINERY AND INTELLIGENCE"
    expect(paper.venue).to eq "Mind 49: 433-460"
    expect(paper.year).to eq "1950"
  end

end