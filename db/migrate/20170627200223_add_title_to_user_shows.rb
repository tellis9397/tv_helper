class AddTitleToUserShows < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_shows, :title, :string
  end
end
