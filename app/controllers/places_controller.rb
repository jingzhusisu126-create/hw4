class PlacesController < ApplicationController
  def index
    if session["user_id"]
      @places = Place.all
    else
      redirect_to "/sessions/new"
    end
  end

  def show
    if session["user_id"]
      @place = Place.find_by({ "id" => params["id"] })
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
    else
      redirect_to "/sessions/new"
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end
end