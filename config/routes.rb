Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  devise_for :users

  resources :weather_dashboards, only: %i[index new create destroy]
end
