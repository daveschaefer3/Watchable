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

    @response.each do |m|
      title = m['title'] ||= "Missing title"
      release_dates = m['release_dates']['dvd']
      imdb = "http://www.imdb.com/title/tt#{m['alternate_ids']['imdb']}/combined"
      poster = m['posters']['detailed'] ||= ""
      desc = m['critics_consensus'] ||= "Critics could not reach consensus about #{title}"
      critics_score = m['ratings']['critics_score'] ||= "80"
      audience_score = m['ratings']['audience_score'] ||= "80"
      watchable_score = ( ( critics_score.to_i * 3 ) + audience_score.to_i ) / 4

      @list += [[title,release_dates,imdb,poster,critics_score,audience_score,watchable_score,desc]]
    end
  end

  def self.sort_order
    @list.sort_by!{ |x| x[6] }.reverse!
  end
end