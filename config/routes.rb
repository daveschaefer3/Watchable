Watchthisnotthat::Application.routes.draw do
#  resources :currents
  match "/upcoming" => "upcomings#index", :as => :upcoming

  root :to => 'currents#index'
end
