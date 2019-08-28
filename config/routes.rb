Rails.application.routes.draw do
  resources :home_requests
  resources :home_offers
  resources :animals
  resources :works
  get 'calendar/(:date)', to: 'calendar#calendar', as: "calendar"
  get '/newhome', to: 'static_pages#newhome', as: "newhome"
  get '/about', to: 'static_pages#about', as: "about"
  get '/faq', to: 'static_pages#faq', as: "faq"
  get '/contact', to: 'static_pages#contact', as: "contact"

  post '/works/create_for_calendar/', to: "works#create_for_calendar", as: 'create_for_calendar'
  delete '/works/delete_for_calendar/:id', to: "works#delete_for_calendar", as: 'delete_for_calendar'

  get '/my_sponsorships', to: "sponsorships#my_sponsorships", as: 'my_sponsorships'
  post '/add_sponsorship', to: "sponsorships#add_sponsorship", as: 'add_sponsorship'
  post '/add_sponsorship_with_new_user', to: "sponsorships#add_sponsorship_with_new_user", as: 'add_sponsorship_with_new_user'

  devise_for :users
  resources :posts
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
