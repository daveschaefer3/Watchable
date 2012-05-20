# Poorly splitting up the return from the model for the view
class CurrentsController < ApplicationController

  def index
    response.headers['Cache-Control'] = 'public, max-age=72000'
    # 3600 = 60 minutes browser cache, 72000 = 20 hrs

    @list = Current.in_theatres
    send_stats
  end

private
  def send_stats
    Metriks.meter('Watchable-view').mark
    Metriks.counter('Watchable-hit').increment
  end
end