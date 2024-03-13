Rails.application.routes.draw do
  root "pages#home"
  resources :dogs
  get "signup", to: "owners#new"
  resources :owners, except: [:new]
  resources :members, only: [:index, :show]
end
