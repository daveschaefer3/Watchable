class GrabsController < ApplicationController

  def index
    response.headers['Cache-Control'] = 'public, max-age=1800' # 1800 = 30 minutes

    @list = Grab.in_theatres

    @title = @list.first[2]
    @score = ( ( @list.first[0] * 3 ) + @list.first[1] ) / 4
    @poster = @list.first[3]
    @desc = "&#8220;".html_safe << @list.first[4] << "&#8221;".html_safe
    @imdb = @list.first[5]

    @second_title = @list.second[2]
    @second_score = ( ( @list.second[0] * 3 ) + @list.second[1] ) / 4
    @second_poster = @list.second[3]
    @second_desc = "&#8220;".html_safe << @list.second[4] << "&#8221;".html_safe
    @second_imdb = @list.second[5]

    @third_title = @list.third[2]
    @third_score = ( ( @list.third[0] * 3 ) + @list.third[1] ) / 4
    @third_poster = @list.third[3]
    @third_desc = "&#8220;".html_safe << @list.third[4] << "&#8221;".html_safe
    @third_imdb = @list.third[5]

    @fourth_title = @list.fourth[2]
    @fourth_score = ( ( @list.fourth[0] * 3 ) + @list.fourth[1] ) / 4
    @fourth_poster = @list.fourth[3]
    @fourth_desc = "&#8220;".html_safe << @list.fourth[4] << "&#8221;".html_safe
    @fourth_imdb = @list.fourth[5]

    @fifth_title = @list.fifth[2]
    @fifth_score = ( ( @list.fifth[0] * 3 ) + @list.fifth[1] ) / 4
    @fifth_poster = @list.fifth[3]
    @fifth_desc = "&#8220;".html_safe << @list.fifth[4] << "&#8221;".html_safe
    @fifth_imdb = @list.fifth[5]

    @sixth_title = @list[5][2]
    @sixth_score = ( ( @list[5][0] * 3 ) + @list[5][1] ) / 4
    @sixth_poster = @list[5][3]
    @sixth_desc = "&#8220;".html_safe << @list[5][4] << "&#8221;".html_safe
    @sixth_imdb = @list[5][5]

    @seventh_title = @list[6][2]
    @seventh_score = ( ( @list[6][0] * 3 ) + @list[6][1] ) / 4
    @seventh_poster = @list[6][3]
    @seventh_desc = "&#8220;".html_safe << @list[6][4] << "&#8221;".html_safe
    @seventh_imdb = @list[6][5]

    @title_list_for_homepage = [@title, @second_title, @third_title, @fourth_title, @fifth_title, @sixth_title, @seventh_title].to_sentence
  respond_to do |format|
      format.html # index.html.erb
    end
  end

end