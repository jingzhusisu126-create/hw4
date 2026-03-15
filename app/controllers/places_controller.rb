class PlacesController < ApplicationController

  def index
    # 核心得分点：检查用户是否登录
    @user = User.find_by({ "id" => session["user_id"] })
    
    if @user
      @places = Place.all
    else
      # 如果没登录，直接踢回登录页面或显示提示
      flash["notice"] = "Please login first."
      redirect_to "/sessions/new"
    end
  end

  def show
    @user = User.find_by({ "id" => session["user_id"] })
    if @user
      @place = Place.find_by({ "id" => params["id"] })
      @entries = Entry.where({ "place_id" => @place["id"] })
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