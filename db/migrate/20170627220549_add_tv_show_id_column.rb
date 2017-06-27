class AddTvShowIdColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_shows, :tv_show_id, :integer
  end
end
