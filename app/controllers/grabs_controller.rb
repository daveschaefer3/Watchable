class GrabsController < ApplicationController

  def index
    response.headers['Cache-Control'] = 'public, max-age=72000' # 3600 = 60 minutes browser cache, 72000 = 20 hrs

    @list = Grab.in_theatres

    @title_1 = @list.first[2]
    @score_1 = ( ( @list.first[0] * 3 ) + @list.first[1] ) / 4
    @poster_1 = @list.first[3]
    @desc_1 = "&#8220;".html_safe << @list.first[4] << "&#8221;".html_safe
    @imdb_1 = @list.first[5]

    @title_2 = @list.second[2]
    @score_2 = ( ( @list.second[0] * 3 ) + @list.second[1] ) / 4
    @poster_2 = @list.second[3]
    @desc_2 = "&#8220;".html_safe << @list.second[4] << "&#8221;".html_safe
    @imdb_2 = @list.second[5]

    @title_3 = @list.third[2]
    @score_3 = ( ( @list.third[0] * 3 ) + @list.third[1] ) / 4
    @poster_3 = @list.third[3]
    @desc_3 = "&#8220;".html_safe << @list.third[4] << "&#8221;".html_safe
    @imdb_3 = @list.third[5]

    @title_4 = @list.fourth[2]
    @score_4 = ( ( @list.fourth[0] * 3 ) + @list.fourth[1] ) / 4
    @poster_4 = @list.fourth[3]
    @desc_4 = "&#8220;".html_safe << @list.fourth[4] << "&#8221;".html_safe
    @imdb_4 = @list.fourth[5]

    @title_5 = @list.fifth[2]
    @score_5 = ( ( @list.fifth[0] * 3 ) + @list.fifth[1] ) / 4
    @poster_5 = @list.fifth[3]
    @desc_5 = "&#8220;".html_safe << @list.fifth[4] << "&#8221;".html_safe
    @imdb_5 = @list.fifth[5]

    Metriks.meter('Watchable-view').mark
    Metriks.counter('Watchable-hit').increment
  end

end