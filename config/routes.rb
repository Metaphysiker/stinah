Rails.application.routes.draw do

  root 'static_pages#welcome'

  localized do
    get 'calendar/(:date)', to: 'calendar#work_calendar', as: "work_calendar"
    get 'work_day_calendar/(:date)', to: 'calendar#work_day_calendar', as: "work_day_calendar"
    get '/newhome', to: 'static_pages#newhome', as: "newhome"
    get '/about', to: 'static_pages#about', as: "about"
    get '/faq', to: 'static_pages#faq', as: "faq"
    get '/contact', to: 'static_pages#contact', as: "contact"
    get '/internship', to: 'static_pages#internship', as: "internship"
    get '/testimonials', to: 'static_pages#testimonials', as: "testimonials"
    get '/support', to: 'static_pages#support', as: "support"
    get '/privacy_statement', to: 'static_pages#privacy_statement', as: "privacy_statement"
    get '/save_the_chicken', to: 'static_pages#save_the_chicken', as: "save_the_chicken"
  end

  get 'home_offers/successfully_added_home_offer', to: 'home_offers#successfully_added_home_offer', as: "successfully_added_home_offer"
  get 'home_requests/successfully_added_home_request', to: 'home_requests#successfully_added_home_request', as: "successfully_added_home_request"

  get '/impressum', to: 'static_pages#impressum', as: "impressum"
  get '/cookies', to: 'static_pages#cookies', as: "cookies"

  post '/works/create_for_calendar/', to: "works#create_for_calendar", as: 'create_for_calendar'
  delete '/works/delete_for_calendar/:id', to: "works#delete_for_calendar", as: 'delete_for_calendar'

  #sponsorship
  get '/sponsorships/my_sponsorships', to: "sponsorships#my_sponsorships", as: 'my_sponsorships'
  post '/sponsorships/add_sponsorship', to: "sponsorships#add_sponsorship", as: 'add_sponsorship'
  post '/sponsorships/add_sponsorship_with_new_user', to: "sponsorships#add_sponsorship_with_new_user", as: 'add_sponsorship_with_new_user'
  get '/sponsorships/activate_sponsorship/:id', to: "sponsorships#activate_sponsorship", as: 'activate_sponsorship'
  get '/sponsorships/deactivate_sponsorship/:id', to: "sponsorships#deactivate_sponsorship", as: 'deactivate_sponsorship'
  post '/sponsorships/check_payment/:id', to: "sponsorships#check_payment", as: 'check_payment'
  post '/sponsorships/add_sponsorship_without_sending_mail', to: "sponsorships#add_sponsorship_without_sending_mail", as: 'add_sponsorship_without_sending_mail'

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

  #admin
  get 'admin/visits', to: 'admin#visits', as: "visits"
  get 'admin/user_overview', to: 'admin#user_overview', as: "user_overview"
  post '/admin/create_user', to: 'admin#create_user', as: "create_user"
  delete '/admin/delete_user/:user_id', to: 'admin#delete_user', as: "delete_user"

  #offerer
  get '/offerers/process_to_create_home_offer', to: 'offerers#process_to_create_home_offer', as: "process_to_create_home_offer"
  post '/add_offerer', to: "offerers#add_offerer", as: 'add_offerer'

  #home_offer
  post 'home_offers/add_home_offer_to_offerer', to: "home_offers#add_home_offer_to_offerer", as: 'add_home_offer_to_offerer'

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
    resources :offerers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
