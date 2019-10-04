Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  resources :tweets do
    collection do
      get :readme
    end
  end

  resources :genres, only: [:show]
  resources :users, only: [:show]
end
