class Grab < ActiveRecord::Base
  KEY = "bewstptmhvbxsc7xcj5wbdbu"
  MOVIE_LIST = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies"
  
  # RUN THIS IN CONSOLE AS Grab.in_theatres
  def self.in_theatres
    response = HTTParty.get(MOVIE_LIST+'/in_theaters.json?apikey='+KEY)
    
    puts "#{response['total']} MOVIES #################################" # return the total number of items
#    puts "#{response['movies'][0]['id']} FIRST ID!"
    
    movies = response['movies']

    movies.each do |movie|
      puts "TITLE: #{movie['title']}, Score: #{movie['ratings']['critics_score']}"
    end

    # I need to return all response['movies'] items, and RE-SORT by either critic or audience score (probably audience?)
    # AT THAT POINT I can re-output or re-assign variables to them as first second third, etc.

  end

  def debug
    puts response.body    
    puts "I say #{response.message}, #{response.code}"
    puts response.headers.inspect
  end


=begin  
  def self.opening
    response = HTTParty.get(MOVIE_LIST+'/opening.json?apikey='+KEY)
    puts response.body
    
    #puts "I say #{response.message}, #{response.code}"
    #puts response.headers.inspect
  end
  
  def self.upcoming
    response = HTTParty.get(MOVIE_LIST+'/upcoming.json?apikey='+KEY)
    puts response.body
    
    #puts "I say #{response.message}, #{response.code}"
    #puts response.headers.inspect
  end
  
  def sort_by_rating
    # Do so here, return the hash again with highest-rated first and so-on
  end
=end



end
