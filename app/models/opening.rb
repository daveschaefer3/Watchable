# Connect to Rotten Tomatoes for movies opening in the next week or so
class Opening < ActiveRecord::Base

  def self.get_response
    response = HTTParty.get("#{MOVIE_LIST}/opening.json?apikey=#{KEY}")
    @response = response["movies"]
  end

  def self.opening_movies
    self.get_response
    self.fill_list
    self.sort_order
  end

  def self.fill_list
    @opening_list = [] # create the movie array

    @response.each do |m|
      title = m['title'] ||= "Missing title"

      release_dates = m['release_dates']['theater']

      imdb_id = m['alternate_ids']['imdb'] if m['alternate_ids'].present?
      imdb_url = "http://www.imdb.com"
      imdb_yes = "#{imdb_url}/title/tt#{imdb_id}/combined"
      imdb = m['alternate_ids'].present? ? imdb_yes : imdb_url

      poster = m['posters']['thumbnail'] ||= ""

      audience = m['ratings']['audience_score'] ||= ""

      @opening_list += [[title,release_dates,imdb,poster,audience]]
    end
  end

  def self.sort_order
    @opening_list.sort_by!{ |x| x[4] }.reverse!
  end
end

