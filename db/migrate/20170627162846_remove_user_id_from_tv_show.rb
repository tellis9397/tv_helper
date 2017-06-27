class RemoveUserIdFromTvShow < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tv_shows, :user_id
  end
end
