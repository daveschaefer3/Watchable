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
      title = m['title']
      imdb = "http://www.imdb.com/title/tt#{m['alternate_ids']['imdb']}/combined"
      poster = m['posters']['detailed'] ||= ""
      desc = m['critics_consensus'] ||= "Critics could not reach consensus about #{title}"
      cs = m['ratings']['critics_score'].to_i ||= 0
      as = m['ratings']['audience_score'].to_i ||= 0
      watchable_score = ( ( cs * 3 ) + as ) / 4

      @list += [[title,imdb,poster,watchable_score,desc]]
    end
  end

  def self.sort_order
    @list.sort_by!{ |x| x[3] }.reverse!
  end
end