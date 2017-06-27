class AddTotalSeasonsAndInfoToTvShow < ActiveRecord::Migration[5.0]
  def change
  	add_column :tv_shows, :total_seasons, :integer
  	add_column :tv_shows, :info,          :string
  end
end
