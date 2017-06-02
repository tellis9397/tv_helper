class TvShow < ActiveRecord::Base
	attr_accessor :info,
		:total_seasons

	belongs_to :user, inverse_of: :tv_shows
	validates :title, presence: true
end
