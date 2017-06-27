require 'net/http'
require 'json'

class ShowSearch
	class << self
	  def get_new_show(title, current_episode = 1, current_season = 1, options = {})
	    json = get_json(title)
	    show_title = json[:title]
	    plot = json[:plot]
	    total_seasons = json[:totalseasons]

	    recent_season = most_recent_season(show_title, total_seasons.to_i) if total_seasons
	    recent_episode = most_recent_episode(show_title, recent_season) if totalseasons

	    show_info = {
	    	title: show_title,
	    	plot: plot,
	    	current_episode: current_episode,
	    	current_season: current_season,
	    	total_seasons: recent_season,
	    	total_episodes: recent_episode
	    }
	  end

	  def most_recent_season(show_title, total_seasons)
	  	first_episode = get_json(show_title, total_seasons)[:episodes].first.symbolize_keys
	  	if first_episode[:Released] == "N/A"
	  		most_recent_season(show_title, total_seasons - 1)
	  	else
	  		total_seasons
	  	end
	  end

	  def most_recent_episode(show_title, last_season)
	  	episodes = get_json(show_title, last_season)[:episodes]
	  	while episodes.last.symbolize_keys[:Released] == "N/A"
	  		episodes.pop
	  	end

	  	episodes.last
	  end

	  def get_json(title, season = '', options = {})
	    title.gsub!(' ', '+')
	    #maybe provide options for
	    url = "http://www.omdbapi.com/?t=#{title}&plot=short&r=json&Season=#{season}&p=10"
	    uri = URI(url)
	    response = Net::HTTP.get(uri)
	    json = symbolize_keys(JSON.parse(response))
	  end

	  def symbolize_keys(dict)
	    dict.keys.each do |key|
	      dict[(key.downcase.to_sym rescue key) || key] = dict.delete(key)
	    end
	    #dict.keys.map { |key| key.downcase.to_sym rescue key}
	    dict
	  end
	end
end
