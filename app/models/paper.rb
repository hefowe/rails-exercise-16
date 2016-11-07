class Paper < ActiveRecord::Base
  validates :title, presence: true

  def authors=(authors)

  end

end
