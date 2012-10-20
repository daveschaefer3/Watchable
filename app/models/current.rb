# Connect to Rotten Tomatoes and squish out the tomato juice
class Current < ActiveRecord::Base

  Current.benchmark("Calculating overall") do
    def self.in_theatres
      self.get_response
      self.construct_list
      self.sort_order
    end
  end

  def self.get_response
    response = HTTParty.get(MOVIE_LIST+'/in_theaters.json?apikey='+KEY)
    @response = response["movies"]
  end

  def self.construct_list
    @list = [] # create the movie array
    @response.each do |m|
      title = m['title'] ||= "Missing title"

      critics_score = m['ratings']['critics_score'] ||= "80"
      audience_score = m['ratings']['audience_score'] ||= "80"

      poster_url = m['posters']['detailed'] ||= ""

      desc = m['critics_consensus'] ||= "Critics could not reach consensus about #{title}"

      if m['alternate_ids'].present?
        imdb = "http://www.imdb.com/title/tt"<<"#{m['alternate_ids']['imdb']}/combined"
      else
        imdb = "http://www.imdb.com/"
        puts "ERRORS: no IMDB ID found on #{title}"
      end

      @list += [[critics_score,audience_score,title,poster_url,desc,imdb]]
    end
  end

  def self.sort_order
    # take the list, sort it by critic's score, get the top five items,
    # then reverse it so it's in descending order
    @list = @list.sort_by{|critics_score| critics_score*+1}.reverse
    # artificially limit it to five films, append: .pop(5).reverse
  end
end