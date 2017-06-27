class UserShow < ActiveRecord::Base

	belongs_to :user, inverse_of: :user_shows

	validates :title,   presence: true
	validates :user_id, presence: true
	validates :tv_show_id, presence: true

	# def info
	# 	.info
	# end

	def is_current?
		#tv_show.update_info
		if total_seasons == current_season
			return total_episodes == current_episode
		else
			false
		end
	end

end
