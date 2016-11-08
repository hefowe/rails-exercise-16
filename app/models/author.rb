class Author < ActiveRecord::Base
  attr_accessor :papers
  validates :last_name, presence: true

  def name
    first_name + ' ' + last_name
  end

  after_initialize do |author|
    author.papers = []
  end

end
