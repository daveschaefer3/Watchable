class GrabsController < ApplicationController

  def index
    @list = Grab.in_theatres

    @title = @list.first[2]
    @score = ( ( @list.first[0] * 3 ) + @list.first[1] ) / 4
    @poster = @list.first[3]
    @desc = @list.first[4]
    @release_date = @list.first[5]
    @imdb = @list.first[6]
    
    @second_title = @list.second[2]
    @second_score = ( ( @list.second[0] * 3 ) + @list.second[1] ) / 4
    @second_poster = @list.second[3]
    @second_desc = @list.second[4]
    @second_release_date = @list.second[5].to_s
    @second_imdb = @list.second[6]
    
    @third_title = @list.third[2]
    @third_score = ( ( @list.third[0] * 3 ) + @list.third[1] ) / 4
    @third_poster = @list.third[3]
    @third_desc = @list.third[4]
    @third_release_date = @list.third[5].to_s
    @third_imdb = @list.third[6]
    
    @fourth_title = @list.fourth[2]
    @fourth_score = ( ( @list.fourth[0] * 3 ) + @list.fourth[1] ) / 4
    @fourth_poster = @list.fourth[3]
    @fourth_desc = @list.fourth[4]
    @fourth_release_date = @list.fourth[5].to_s
    @fourth_imdb = @list.fourth[6]
    
    @fifth_title = @list.fifth[2]
    @fifth_score = ( ( @list.fifth[0] * 3 ) + @list.fifth[1] ) / 4
    @fifth_poster = @list.fifth[3]
    @fifth_desc = @list.fifth[4]
    @fifth_release_date = @list.fifth[5].to_s
    @fifth_imdb = @list.fifth[6]

    @sixth_title = @list[5][2]
    @sixth_score = ( ( @list[5][0] * 3 ) + @list[5][1] ) / 4
    @sixth_poster = @list[5][3]
    @sixth_desc = @list[5][4]
    @sixth_release_date = @list[5][5].to_s
    @sixth_imdb = @list[5][6]
    
    @seventh_title = @list[6][2]
    @seventh_score = ( ( @list[6][0] * 3 ) + @list[6][1] ) / 4
    @seventh_poster = @list[6][3]
    @seventh_desc = @list[6][4]
    @seventh_release_date = @list[6][5].to_s
    @seventh_imdb = @list[6][6]

  respond_to do |format|
      format.html # index.html.erb
    end
  end

end