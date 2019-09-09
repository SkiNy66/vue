Rails.application.routes.draw do
  devise_for :clients
  devise_for :staffs
  
  root to: "welcome#index"
  
  namespace :cabinet do
    root to: "welcome#index"
  end

  namespace :office do
    root to: "welcome#index"
  end
end
