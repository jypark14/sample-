class Remove < ActiveRecord::Migration[5.1]
  def change
    remove_column(:investigations, :crime_id)
  end
end
