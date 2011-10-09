class GrabsController < ApplicationController
  # GET /grabs
  # GET /grabs.json
  def index
    @grabs = Grab.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grabs }
    end
  end

  # GET /grabs/1
  # GET /grabs/1.json
  def show
    @grab = Grab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grab }
    end
  end

  # GET /grabs/new
  # GET /grabs/new.json
  def new
    @grab = Grab.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grab }
    end
  end

  # GET /grabs/1/edit
  def edit
    @grab = Grab.find(params[:id])
  end

  # POST /grabs
  # POST /grabs.json
  def create
    @grab = Grab.new(params[:grab])

    respond_to do |format|
      if @grab.save
        format.html { redirect_to @grab, notice: 'Grab was successfully created.' }
        format.json { render json: @grab, status: :created, location: @grab }
      else
        format.html { render action: "new" }
        format.json { render json: @grab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grabs/1
  # PUT /grabs/1.json
  def update
    @grab = Grab.find(params[:id])

    respond_to do |format|
      if @grab.update_attributes(params[:grab])
        format.html { redirect_to @grab, notice: 'Grab was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @grab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grabs/1
  # DELETE /grabs/1.json
  def destroy
    @grab = Grab.find(params[:id])
    @grab.destroy

    respond_to do |format|
      format.html { redirect_to grabs_url }
      format.json { head :ok }
    end
  end
end
