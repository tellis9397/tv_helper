class AddUserIdToTvShow < ActiveRecord::Migration[5.0]
  def change
    add_column :tv_shows, :user_id,       :integer
  end
end
