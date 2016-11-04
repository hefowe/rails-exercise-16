require 'rails_helper'

describe Author, :type => :feature do

  it 'should be created when initialized with values' do
    author = Author.new

    author.first_name = "Alan"
    author.last_name = "Turing"
    author.homepage = "http://wikipedia.de/Alan_Turing"

    expect(author.first_name).to eq "Alan"
    expect(author.last_name).to eq "Turing"
    expect(author.homepage).to eq "http://wikipedia.de/Alan_Turing"
  end

  it 'should return the full name' do
    author = Author.new

    author.first_name = "Alan"
    author.last_name = "Turing"
    author.homepage = "http://wikipedia.de/Alan_Turing"

    expect(author.name).to eq "Alan Turing"
  end
end