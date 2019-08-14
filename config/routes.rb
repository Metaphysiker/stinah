Rails.application.routes.draw do
  get 'calendar/(:date)', to: 'calendar#calendar', as: "calendar"
  devise_for :users
  resources :posts
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
