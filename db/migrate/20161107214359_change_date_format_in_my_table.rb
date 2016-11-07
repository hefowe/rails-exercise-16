class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
    change_column :papers, :year, :integer
  end
end
