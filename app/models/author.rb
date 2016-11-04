class Author < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :homepage

  def name
    first_name + ' ' + last_name
  end

end
