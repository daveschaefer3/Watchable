# Connect to Rotten Tomatoes for movies coming in the next month or so
class Upcoming < ActiveRecord::Base

  def self.releases(list)
    response = HTTParty.get("#{MOVIE_LIST}/#{list}.json?apikey=#{KEY}")
    @response = response["movies"]
  end

  def self.opening_movies_list
    self.releases("opening")
    self.fill_list
    self.sort_order
  end

  def self.upcoming_movies_list
    self.releases("upcoming")
    self.fill_list
    self.sort_order
  end

  def self.fill_list
    @list = [] # create the movie array

    @response.each do |m|
      title = m['title'] ||= "Missing title"
      release_date = m['release_dates']['theater']
      imdb = "http://www.imdb.com/title/tt#{m['alternate_ids']['imdb']}/combined"
      poster = m['posters']['thumbnail'] ||= ""
      audience = m['ratings']['audience_score'] ||= ""

      @list += [[title,release_date,imdb,poster,audience]]
    end
  end

  def self.sort_order
    @list.sort_by!{ |x| x[4] }.reverse!
  end
end