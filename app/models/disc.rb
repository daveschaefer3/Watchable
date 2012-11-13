# DVD and Blu-ray releases
class Disc < ActiveRecord::Base

  def self.current_releases
    discs_current_releases = HTTParty.get("#{DISC_LIST}/current_releases?apikey=#{KEY}")
    @response = discs_current_releases["movies"]
  end

  def self.new_releases
    discs_new_releases = HTTParty.get("#{DISC_LIST}/new_releases?apikey=#{KEY}")
    @response = discs_new_releases["movies"]
  end

# YES, this is all huge and ugly and verbose. I'll make better methods to pass these in once it works
  def self.current_releases_list
    self.current_releases
    self.fill_list
    self.sort_order
  end

  def self.new_releases_list
    self.new_releases
    self.fill_list
    self.sort_order
  end

  def self.fill_list
    @list = [] # create the movie array

    @response.each do |m|
      title = m['title'] ||= "Missing title"

      release_dates = m['release_dates']['dvd']

      imdb_url = "http://www.imdb.com"
      imdb_yes = "#{imdb_url}/title/tt#{m['alternate_ids']['imdb']}/combined"
      imdb = m['alternate_ids'].present? ? imdb_yes : imdb_url

      poster = m['posters']['thumbnail'] ||= ""

      critics_score = m['ratings']['critics_score'] ||= "80"
      audience_score = m['ratings']['audience_score'] ||= "80"

      @list += [[title,release_dates,imdb,poster,critics_score,audience_score]]
    end
  end

  def self.sort_order
    puts "#{@list} $$$$$$$$$$$$$$$$$$$$$$$"
    @list = @list.sort_by{|critics_score| critics_score*+1}
  end
end