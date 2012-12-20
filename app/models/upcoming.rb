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

    @response.each do |movie|
      title = movie['title'] ||= "Missing title"
      release_date = movie['release_dates']['theater']
      # imdb = "http://www.imdb.com/title/tt#{movie['alternate_ids']['imdb']}/combined"

      if movie['alternate_ids']
        imdb = "http://www.imdb.com/title/tt#{movie['alternate_ids']['imdb']}/combined"
      else
        imdb = "http://www.imdb.com/find?q=#{movie['title']}&s=all"
      end

      poster = movie['posters']['thumbnail'] ||= ""
      audience = movie['ratings']['audience_score'] ||= ""

      @list += [[title,release_date,imdb,poster,audience]]
    end
  end

  def self.sort_order
    @list.sort_by!{ |list_items| list_items[4] }.reverse!
  end
end