Rails.application.routes.draw do
  root "pages#home"
  resources :dogs
end
