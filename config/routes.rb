Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    get :search, on: :collection
    resource :favorites, only: %i[create destroy]
  end

  resources :users

  root 'homes#top'
end
