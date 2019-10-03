Rails.application.routes.draw do
  devise_for :clients, :skip => [:registrations] 
  devise_for :staffs, :skip => [:registrations] 
  
  root to: "welcome#index"

  namespace :cabinet do
    root to: "welcome#index"
  end

  namespace :office do
    root to: "welcome#index"
    
    namespace :api do
      resources :organizations, only: [:index, :create, :update, :destroy]
      resources :staffs, only: [:index, :update, :create] do
        collection do
          get 'current_staff_email'
          post 'link_client_with_organization'
        end
        member do
          post 'reset_password'
        end
      end
      resources :clients, only: [:index, :update, :create] do
        member do
          post 'reset_password'
        end
      end
      resources :hardwares, only: [:index]
    end
    
    get '/*slug', to: "welcome#index"
  end

  get '/*slug', to: "welcome#index"
end
