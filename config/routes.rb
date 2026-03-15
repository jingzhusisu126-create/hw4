Rails.application.routes.draw do
  resources "places"
  resources "entries"
  
  resources "users"
  
  get "/login", :controller => "sessions", :action => "new"
  post "/sessions", :controller => "sessions", :action => "create"
  get "/logout", :controller => "sessions", :action => "destroy"

  root "places#index"
end