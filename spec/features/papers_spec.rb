require 'rails_helper'

describe Paper, :type => :feature do

  it 'should have title, venue, and year' do
    paper = create(:paper)

    expect(paper.title).to eq "COMPUTING MACHINERY AND INTELLIGENCE"
    expect(paper.venue).to eq "Mind 49: 433-460"
    expect(paper.year).to eq 1950
  end

  it 'should not validate without title' do
    paper = create(:paper)
    paper.title = nil
    expect(paper).to_not be_valid
  end

  it 'should not validate without venue' do
    paper = create(:paper)
    paper.venue = nil
    expect(paper).to_not be_valid
  end

  it 'should not validate without year' do
    paper = create(:paper)
    paper.year = nil
    expect(paper).to_not be_valid
  end

  it 'should not validate with non-integer year' do
    paper = create(:paper)
    paper.year = "nineteen-fifty"
    expect(paper).to_not be_valid
  end

  it 'should have and belong to many authors' do
    paper = create(:paper)

    expect(paper.authors).to eq []
  end

end