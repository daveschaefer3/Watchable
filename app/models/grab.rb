class Grab < ActiveRecord::Base
  KEY = "bewstptmhvbxsc7xcj5wbdbu"
  MOVIE_LIST = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies"
  
  # RUN THIS IN CONSOLE AS Grab.in_theatres
  def self.in_theatres
    response = HTTParty.get(MOVIE_LIST+'/in_theaters.json?apikey='+KEY)
    movies = response["movies"]

    puts "create a blank array:\n"
    list = [] # create the movie array
    
    movies.each do |movie|
     title = movie['title']
     score = movie['ratings']['critics_score']
     poster_url = movie['posters']['detailed']
     
     list += [[score,title,poster_url]] 
     
     puts "Movie: #{title}, Score: #{score}"
    end
    
    puts "\n\n ===================================================================== \n\n"
    puts "print out the movie array:\n"
    puts list.to_s # print out the movie array
    
    puts "\n\n ===================================================================== \n\n"    
    puts "sort the movie array:\n"
    #sorted = list.sort {|x,y| y[0] <=> x[0] }
    
    sorted = list.sort_by{|score| score*+1}.reverse
    
    puts sorted.to_s

    puts "\n\n ===================================================================== \n\n"
    puts "Watch this: #{sorted.first[1]} with a score of #{sorted.first[0]}.\nGet the poster at: #{sorted.first[2]}\n\n"
    
    puts "2nd place: #{sorted.second[1]}"
    puts "3rd place: #{sorted.third[1]}"
    puts "4th: #{sorted.fourth[1]}"
    puts "5th: #{sorted.fifth[1]}"

    puts "\n\n ===================================================================== \n\n"

  end

    # I need to return all response['movies'] items, and RE-SORT by either critic or audience score (probably audience?)
    # AT THAT POINT I can re-output or re-assign variables to them as first second third, etc.

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
