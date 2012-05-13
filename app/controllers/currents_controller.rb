# Poorly splitting up the return from the model for the view
class CurrentsController < ApplicationController

  def index
    response.headers['Cache-Control'] = 'public, max-age=72000'
    # 3600 = 60 minutes browser cache, 72000 = 20 hrs

    @list = Current.in_theatres

    movie_1
    movie_2
    movie_3
    movie_4
    movie_5
    send_stats

    respond_to do |format|
      format.html # index.html.erb
      format.json { render }
    end
  end

private
  def nicer_quote(description)
    "&#8220;#{description}&#8221;".html_safe
  end

  def nicer_rating(critical,audience)
    ( ( critical * 3 ) + audience ) / 4
  end

  def movie_1
    @title_1 = @list.first[2]
    @score_1 = nicer_rating(@list.first[0],@list.first[1])
    @poster_1 = @list.first[3]
    @desc_1 = nicer_quote(@list.first[4])
    @imdb_1 = @list.first[5]
  end

  def movie_2
    @title_2 = @list.second[2]
    @score_2 = nicer_rating(@list.second[0],@list.second[1])
    @poster_2 = @list.second[3]
    @desc_2 = nicer_quote(@list.second[4])
    @imdb_2 = @list.second[5]
  end

  def movie_3
    @title_3 = @list.third[2]
    @score_3 = nicer_rating(@list.third[0],@list.third[1])
    @poster_3 = @list.third[3]
    @desc_3 = nicer_quote(@list.third[4])
    @imdb_3 = @list.third[5]
  end

  def movie_4
    @title_4 = @list.fourth[2]
    @score_4 = nicer_rating(@list.fourth[0],@list.fourth[1])
    @poster_4 = @list.fourth[3]
    @desc_4 = nicer_quote(@list.fourth[4])
    @imdb_4 = @list.fourth[5]
  end

  def movie_5
    @title_5 = @list.fifth[2]
    @score_5 = nicer_rating(@list.fifth[0],@list.fifth[1])
    @poster_5 = @list.fifth[3]
    @desc_5 = nicer_quote(@list.fifth[4])
    @imdb_5 = @list.fifth[5]
  end

  def send_stats
    Metriks.meter('Watchable-view').mark
    Metriks.counter('Watchable-hit').increment
  end
end