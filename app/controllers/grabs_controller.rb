class GrabsController < ApplicationController

  def index
#    @grabs = Grab.all

    respond_to do |format|
      format.html # index.html.erb
#      format.json { render json: @grabs }
    end
  end

end
