class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user.password = params["password"]
    @user.save
    session["user_id"] = @user.id
    flash["notice"] = "Thanks for signing up!"
    redirect_to "/places"
  end
end
