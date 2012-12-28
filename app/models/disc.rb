# DVD and Blu-ray releases
class Disc < ActiveRecord::Base

  def self.releases(list)
    response = HTTParty.get("#{DISC_LIST}/#{list}?apikey=#{KEY}")
    @response = response["movies"]
  end

  def self.current_releases_list
    self.releases("current_releases")
    self.fill_list
    self.sort_order
  end

  def self.new_releases_list
    self.releases("new_releases")
    self.fill_list
    self.sort_order
  end

  def self.fill_list
    @list = [] # create the movie array

    @response.each { |movie|
      title  = movie['title']
      imdb   = "http://www.imdb.com/title/tt#{movie['alternate_ids']['imdb']}/combined"
      poster = movie['posters']['detailed'] ||= ""
      desc   = movie['critics_consensus'] ||= "Critics could not reach consensus about #{title}"

      watchable_score = self.ratings(movie['ratings'])

      @list += [[title, imdb, poster, watchable_score, desc]]
    }
  end

  def self.ratings(movie)
    ( ( movie['critics_score'] * 3 ) + movie['audience_score'] ) / 4
  end

  def self.sort_order
    @list.sort_by!{ |list_items| list_items[3] }.reverse!
  end
end