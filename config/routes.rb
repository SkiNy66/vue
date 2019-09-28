Rails.application.routes.draw do
  devise_for :clients, :skip => [:registrations] 
  devise_for :staffs, :skip => [:registrations] 
  
  root to: "welcome#index"

  namespace :cabinet do
    root to: "welcome#index"
  end

  namespace :office do
    root to: "welcome#index"
    get 'list', to: 'welcome#list'
    get 'current_staff_email', to: 'welcome#current_staff_email'
    post 'create_new_client', to: 'welcome#create_new_client'

    resources :organizations, only: [:index, :create, :destroy]
  end
end
