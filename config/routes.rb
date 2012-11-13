Watchthisnotthat::Application.routes.draw do
#  resources :currents
  match "/upcoming" => "upcomings#index", :as => :upcoming
  match "/discs" => "discs#index", :as => :discs

  root :to => 'currents#index'
end
