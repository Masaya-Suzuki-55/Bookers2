Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/top'
  get 'home/about'
  root to: 'homes#top'

  resources :users
  resources :books

end
