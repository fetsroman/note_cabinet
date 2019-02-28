Rails.application.routes.draw do
  devise_for :users
  resources :docs
  get 'welcome/index'
  
  root 'welcome#index'
end
