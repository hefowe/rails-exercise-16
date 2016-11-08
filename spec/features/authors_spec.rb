require 'rails_helper'

describe Author, :type => :feature do

  it 'should be created when initialized with values' do
    author = create(:author)

    expect(author.first_name).to eq "Alan"
    expect(author.last_name).to eq "Turing"
    expect(author.homepage).to eq "http://wikipedia.org/Alan_Turing"
  end

  it 'should return the full name' do
    author = create(:author)

    expect(author.name).to eq "Alan Turing"
  end

  it 'should not validate without last name' do
    author = create(:author)
    author.last_name = nil
    expect(author).to_not be_valid
  end

  it 'should have and belong to many papers' do
    author = create(:author)

    expect(author.papers).to eq []
  end

end