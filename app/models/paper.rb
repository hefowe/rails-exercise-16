class Paper < ActiveRecord::Base
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true

  def authors=(authors)

  end

end
