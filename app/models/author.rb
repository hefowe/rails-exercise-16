class Author < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :homepage

  def initialize(first_name = "Alan", last_name = "Turing", homepage = "http://wikipedia.de/Alan_Turing")
    @first_name = first_name
    @last_name = last_name
    @homepage = homepage
  end
end
