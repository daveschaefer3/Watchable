Watchthisnotthat::Application.routes.draw do
#  resources :grabs
  match "/upcoming" => "upcomings#index", :as => :upcoming

  root :to => 'grabs#index'
end
