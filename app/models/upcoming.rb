# Connect to Rotten Tomatoes for movies coming in the next month or so
class Upcoming < ActiveRecord::Base

  def self.get_response
    response = HTTParty.get("#{MOVIE_LIST}/upcoming.json?apikey=#{KEY}")
    @response = response["movies"]
  end

  def self.upcoming_movies
    self.get_response
    self.fill_list
    self.sort_order
  end

  def self.fill_list
    @list = [] # create the movie array

    @response.each do |m|
      title = m['title'] ||= "Missing title"

      release_dates = m['release_dates']['theater']

      imdb_url = "http://www.imdb.com"
      imdb_yes = "#{imdb_url}/title/tt#{m['alternate_ids']['imdb']}/combined"
      imdb = m['alternate_ids'].present? ? imdb_yes : imdb_url

      poster = m['posters']['thumbnail'] ||= ""

      @list += [[title,release_dates,imdb,poster]]
    end
  end

  def self.sort_order
    @list = @list.sort_by{|release_dates|}#.reverse
  end
end