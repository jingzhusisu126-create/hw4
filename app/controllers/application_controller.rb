class ApplicationController < ActionController::Base
  def authenticate_user
    unless session["user_id"]
      redirect_to "/sessions/new"
    end
  end
end
