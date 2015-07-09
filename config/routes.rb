Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :pictures
  end

  resources :pictures do
    resources :tags
  end

  root to: "users#index"

end
