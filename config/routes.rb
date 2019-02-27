Rails.application.routes.draw do
  resources :docs
  get 'welcome/index'
  
  root 'welcome#index'
end
