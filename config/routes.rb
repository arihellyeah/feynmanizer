Rails.application.routes.draw do

  devise_for :users
  root 'facts#index'
  resources :facts
  get 'about', to: 'facts#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
