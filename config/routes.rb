Rails.application.routes.draw do

  root 'static_pages#welcome'

  localized do
    get 'calendar/(:date)', to: 'calendar#work_calendar', as: "work_calendar"
    get '/newhome', to: 'static_pages#newhome', as: "newhome"
    get '/about', to: 'static_pages#about', as: "about"
    get '/faq', to: 'static_pages#faq', as: "faq"
    get '/contact', to: 'static_pages#contact', as: "contact"
    get '/internship', to: 'static_pages#internship', as: "internship"
    get '/testimonials', to: 'static_pages#testimonials', as: "testimonials"
    get '/support', to: 'static_pages#support', as: "support"
    get '/privacy_statement', to: 'static_pages#privacy_statement', as: "privacy_statement"
  end

  get 'home_offers/successfully_added_home_offer', to: 'home_offers#successfully_added_home_offer', as: "successfully_added_home_offer"
  get 'home_requests/successfully_added_home_request', to: 'home_requests#successfully_added_home_request', as: "successfully_added_home_request"

  get '/impressum', to: 'static_pages#impressum', as: "impressum"
  get '/cookies', to: 'static_pages#cookies', as: "cookies"

  post '/works/create_for_calendar/', to: "works#create_for_calendar", as: 'create_for_calendar'
  delete '/works/delete_for_calendar/:id', to: "works#delete_for_calendar", as: 'delete_for_calendar'

  get '/my_sponsorships', to: "sponsorships#my_sponsorships", as: 'my_sponsorships'
  post '/add_sponsorship', to: "sponsorships#add_sponsorship", as: 'add_sponsorship'
  post '/add_sponsorship_with_new_user', to: "sponsorships#add_sponsorship_with_new_user", as: 'add_sponsorship_with_new_user'
  get '/sponsorships/activate_sponsorship/:id', to: "sponsorships#activate_sponsorship", as: 'activate_sponsorship'
  get '/sponsorships/deactivate_sponsorship/:id', to: "sponsorships#deactivate_sponsorship", as: 'deactivate_sponsorship'
  post '/sponsorships/check_payment/:id', to: "sponsorships#check_payment", as: 'check_payment'

  post '/home_requests/archive/:id', to: "home_requests#archive", as: "archive_home_request"
  post '/home_offers/archive/:id', to: "home_offers#archive", as: "archive_home_offer"
  get '/home_offers/matches_for_home_offer', to: "home_offers#matches_for_home_offer", as: "matches_for_home_offer"
  get '/home_offers/compare/:home_offer_id/:home_request_id', to: "home_offers#compare", as: "home_offers_compare"
  get '/home_requests/compare/:home_request_id/:home_offer_id', to: "home_requests#compare", as: "home_requests_compare"

  #search
  get 'animals/search_animals', to: 'animals#search_animals', as: 'search_animals'
  get 'home_offers/search_home_offers', to: 'home_offers#search_home_offers', as: 'search_home_offers'
  get 'home_requests/search_home_requests', to: 'home_requests#search_home_requests', as: 'search_home_requests'
  get 'sponsorships/search_sponsorships', to: 'sponsorships#search_sponsorships', as: 'search_sponsorships'

  #visits
  get '/visits', to: 'static_pages#visits', as: "visits"

  #redirects
  #get '/team', to: redirect('/team_members')

  devise_for :users
  localized do
    resources :team_members
    resources :posts
    resources :home_requests
    resources :home_offers
    resources :animals
    resources :works
    resources :sponsorships
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
