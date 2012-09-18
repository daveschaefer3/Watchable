# Poorly splitting up the return from the model for the view
class CurrentsController < ApplicationController

  caches_page :index

  def index
      response.headers['Cache-Control'] = 'public, max-age=72000'
      # 3600 = 60 minutes browser cache, 72000 = 20 hrs
      @list = Current.in_theatres
      create_client
      send_stats
  end

private
  def create_client
    @client ||= YouTubeIt::Client.new(dev_key: "AI39si48veFGm5Z9I60P9ShD8EQh9VI7m5ba_DDYPzHUiTp9kEgHENcvEbxGTsnGkg-3PD9VI5yfaDFJT0EsuwnyCYuhaFFNKQ")
  end

  def send_stats
    #Metriks.meter('Watchable-view').mark
    #Metriks.counter('Watchable-hit').increment
  end
end