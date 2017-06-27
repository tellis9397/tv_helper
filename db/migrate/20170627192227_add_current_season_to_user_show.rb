class AddCurrentSeasonToUserShow < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_shows, :current_season,  :integer
  	add_column :user_shows, :current_episode, :integer
  end
end
