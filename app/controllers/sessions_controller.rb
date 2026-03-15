class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user && @user.authenticate(params["password"])
      session["user_id"] = @user.id
      flash["notice"] = "Welcome back!"
      redirect_to "/places"
    else
      flash["notice"] = "Incorrect email or password."
      render "new"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye!"
    redirect_to "/sessions/new"
  end
end
