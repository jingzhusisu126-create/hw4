class PlacesController < ApplicationController
  before_action :authenticate_user

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @place
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
    else
      redirect_to "/places"
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end
end
