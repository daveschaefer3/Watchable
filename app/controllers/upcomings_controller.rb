# Poorly splitting up the return from the model for the view
class UpcomingsController < ApplicationController
  def index
    response.headers['Cache-Control'] = 'public, max-age=72000' # 72000 seconds = 20 hrs

    @opening_list = Opening.opening_movies
    @upcoming_list = Upcoming.upcoming_movies
  end
end