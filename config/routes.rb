Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  devise_for :users

  resources :weather_dashboards, only: %i[index new create destroy] do
    get '/update_state_options', to: "weather_dashboards#update_state_options", on: :collection
    get '/update_city_options', to: "weather_dashboards#update_city_options", on: :collection
  end
end
