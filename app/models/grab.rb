class Grab < ActiveRecord::Base
  KEY = "bewstptmhvbxsc7xcj5wbdbu"
  MOVIE_LIST = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies"

  def self.in_theatres
    self.get_response
    self.construct_list
    self.sort_order
  end

  def self.get_response
    response = HTTParty.get(MOVIE_LIST+'/in_theaters.json?apikey='+KEY)
    @response = response["movies"]
  end

  def self.construct_list
    @list = [] # create the movie array

    @response.each do |movie|
      if movie['title'].present?
        title = movie['title']
      else
        title = "Missing title"
        puts "ERRORS: Missing title"
      end

      if movie['ratings']['critics_score'].present? and movie['ratings']['audience_score'].present?
        critics_score = movie['ratings']['critics_score']
        audience_score = movie['ratings']['audience_score']
      else
        critics_score = 0
        audience_score = 0
        puts "ERRORS: Missing scores in #{title} Critics: #{critics_score}, Audience: #{audience_score}"
      end

      if movie['posters']['detailed'].present?
        poster_url = movie['posters']['detailed'] # movie['posters']['original']
      else
        poster_url = ""
        puts "ERRORS: Poster missing on #{title}"
      end

      if desc = movie['critics_consensus'].present?
        desc = "Consensus"
        desc = movie['critics_consensus']
      else
        desc = "Critics could not reach consensus about #{title}"
        puts "ERRORS: No consensus on #{title}"
      end

      if movie['alternate_ids'].present?
        imdb = "http://www.imdb.com/title/tt"+movie['alternate_ids']['imdb']+"/combined"
      else
        imdb = "http://www.imdb.com/"
        puts "ERRORS: no IMDB ID found on #{title}"
      end

      @list += [[critics_score,audience_score,title,poster_url,desc,imdb]]
    # puts "Movie: #{title}, Score: #{critics_score}, #{audience_score}"
    end
  end

  def self.sort_order
    # take the list, sort it by critic's score, get the top five items, then reverse it so it's in descending order
    @list = @list.sort_by{|critics_score| critics_score*+1}.pop(5).reverse
  end

end