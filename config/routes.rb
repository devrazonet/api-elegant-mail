Rails.application.routes.draw do
  root to: "letters#index"
  namespace :admin do
    resources :letters
  end
  resources :letters, only: [:index, :new, :create, :show]
end
