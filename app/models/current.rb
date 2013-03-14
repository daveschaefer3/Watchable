# Connect to Rotten Tomatoes and squish out the in-theatre tomato juice
class Current < ActiveRecord::Base

Current.benchmark("Calculating overall") do
  def self.in_theatres
    self.get_response
    self.construct_list
    self.sort_order
  end
end

  def self.get_response
    response = HTTParty.get(MOVIE_LIST+'/in_theaters.json?page_limit=50&apikey='+KEY)
    @response = response["movies"]
  end

  def self.construct_list
    @list = [] # create the movie array
    @response.each { |movie|
      title = movie['title'] ||= 'Missing title'

      watchable_score = self.ratings(movie['ratings'])

      poster_url = movie['posters']['detailed'] ||= ''
      desc       = movie['critics_consensus'] ||= "No critical consensus available for #{title}"

      movie['alternate_ids'] ?
          imdb = "http://www.imdb.com/title/tt#{movie['alternate_ids']['imdb']}/combined" :
          imdb = "http://www.imdb.com/find?q=#{movie['title']}&s=all"

      @list += [[watchable_score, title, poster_url, desc, imdb]]
    }
  end

  def self.ratings(movie)
    ( ( movie['critics_score'] * 3 ) + movie['audience_score'] ) / 4
  end

  def self.sort_order
    @list = @list.sort_by{|critics_score| critics_score}.reverse!
    # to artificially limit it to five films, append: .pop(5).reverse
  end
end