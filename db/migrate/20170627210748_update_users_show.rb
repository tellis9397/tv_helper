class UpdateUsersShow < ActiveRecord::Migration[5.0]
  def change
  	remove_column :user_shows, :tv_show
  	add_column :user_shows, :total_seasons, :integer
  	add_column :user_shows, :total_episodes, :integer
  end
end
