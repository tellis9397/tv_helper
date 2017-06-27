class TvShow < ActiveRecord::Base

	validates :title, presence: true

end
