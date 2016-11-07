class Paper < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true, numericality: { only_integer: true }

  def authors=(authors)

  end

end
