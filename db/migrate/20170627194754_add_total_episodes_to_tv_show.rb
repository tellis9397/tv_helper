class AddTotalEpisodesToTvShow < ActiveRecord::Migration[5.0]
  def change
  	add_column :tv_shows, :total_episodes, :integer
  end
end
