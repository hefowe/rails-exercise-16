require 'rails_helper'

describe Author, :type => :feature do

  it 'should be created when initialized with values' do
    author = Author.new("Alan", "Turing", "http://wikipedia.de/Alan_Turing")

    expect(author.first_name).to eq "Alan"
    expect(author.last_name).to eq "Turing"
    expect(author.homepage).to eq "http://wikipedia.de/Alan_Turing"
  end
end