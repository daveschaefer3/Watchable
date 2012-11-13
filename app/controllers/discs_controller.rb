class DiscsController < ApplicationController

  def index
    response.headers['Cache-Control'] = 'public, max-age=72000'

    @discs_current_releases = Disc.current_releases_list
    @discs_new_releases     = Disc.new_releases_list
  end
end