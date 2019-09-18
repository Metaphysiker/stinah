Rails.application.routes.draw do

  get 'calendar/(:date)', to: 'calendar#work_calendar', as: "work_calendar"
  get '/newhome', to: 'static_pages#newhome', as: "newhome"
  get '/about', to: 'static_pages#about', as: "about"
  get '/faq', to: 'static_pages#faq', as: "faq"
  get '/contact', to: 'static_pages#contact', as: "contact"

  post '/works/create_for_calendar/', to: "works#create_for_calendar", as: 'create_for_calendar'
  delete '/works/delete_for_calendar/:id', to: "works#delete_for_calendar", as: 'delete_for_calendar'

  get '/my_sponsorships', to: "sponsorships#my_sponsorships", as: 'my_sponsorships'
  post '/add_sponsorship', to: "sponsorships#add_sponsorship", as: 'add_sponsorship'
  post '/add_sponsorship_with_new_user', to: "sponsorships#add_sponsorship_with_new_user", as: 'add_sponsorship_with_new_user'
  get '/sponsorships/activate_sponsorship/:id', to: "sponsorships#activate_sponsorship", as: 'activate_sponsorship'
  get '/sponsorships/deactivate_sponsorship/:id', to: "sponsorships#deactivate_sponsorship", as: 'deactivate_sponsorship'

  post '/home_offers/archive/:id', to: "home_offers#archive", as: "archive_home_offer"
  get '/home_offers/matches_for_home_offer', to: "home_offers#matches_for_home_offer", as: "matches_for_home_offer"
  get '/home_offers/compare/:home_offer_id/:home_request_id', to: "home_offers#compare", as: "home_offers_compare"
  get '/home_requests/compare/:home_request_id/:home_offer_id', to: "home_requests#compare", as: "home_requests_compare"

  devise_for :users
  resources :posts
  resources :home_requests
  resources :home_offers
  resources :animals
  resources :works
  resources :sponsorships
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
