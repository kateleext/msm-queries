Rails.application.routes.draw do
  get "/", :controller => "misc", :action => "homepage"
  get "/about", :controller => "misc", :action => "about"


  get "/movies", :controller => "movie", :action => "index"
  get "/directors", :controller => "director", :action => "index"
  get "/actors", :controller => "actor", :action => "index"

    get "/directors/youngest", :controller => "director", :action => "youngest"
  get "/directors/eldest", :controller => "director", :action => "eldest"

  get "/movies/:id", :controller => "movie", :action => "details"
  get "/directors/:id", :controller => "director", :action => "details"
  get "/actors/:id", :controller => "actor", :action => "details"


end
