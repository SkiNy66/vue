Rails.application.routes.draw do
  devise_for :clients, :skip => [:registrations] 
  devise_for :staffs, :skip => [:registrations] 
  
  root to: "welcome#index"
  
  namespace :cabinet do
    root to: "welcome#index"
  end

  namespace :office do
    root to: "welcome#index"
  end
end
