class RemoveShowIdAndAddTvShowToUserShows < ActiveRecord::Migration[5.0]
  def change
  	remove_column :user_shows, :show_id
  	add_column :user_shows, :tv_show, :tv_show
  end
end
