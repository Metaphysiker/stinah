Rails.application.routes.draw do
  resources :works
  get 'calendar/(:date)', to: 'calendar#calendar', as: "calendar"
  get '/newhome', to: 'static_pages#newhome', as: "newhome"
  post '/works/create_for_calendar/', to: "works#create_for_calendar", as: 'create_for_calendar'
  delete '/works/delete_for_calendar/:id', to: "works#delete_for_calendar", as: 'delete_for_calendar'
  devise_for :users
  resources :posts
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
