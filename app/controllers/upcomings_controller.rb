# Poorly splitting up the return from the model for the view
class UpcomingsController < ApplicationController

  def index
    response.headers['Cache-Control'] = 'public, max-age=72000'
    # 3600 = 60 minutes browser cache, 72000 = 20 hrs

    @list = Upcoming.upcoming_movies

    send_stats

    respond_to do |format|
      format.html # index.html.erb
      format.json { render }
    end
  end

private
  def send_stats
    Metriks.meter('Watchable-view').mark
    Metriks.counter('Watchable-hit').increment
  end
end