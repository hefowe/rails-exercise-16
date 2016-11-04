class Author < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :homepage

  def initialize(first_name, last_name, homepage)
    @first_name = first_name
    @last_name = last_name
    @homepage = homepage
  end
end
