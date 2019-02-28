Rails.application.routes.draw do
  devise_for :users
  resources :docs
  get 'welcome/index'
  
  authenticated :user do
    root 'docs#index', as: 'authenticated_root'
  end
  
  root 'welcome#index'
end
