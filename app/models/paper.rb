class Paper < ActiveRecord::Base
  attr_accessor :authors
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true, numericality: { only_integer: true }

end
