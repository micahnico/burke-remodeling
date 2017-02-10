Rails.application.routes.draw do
  root to: "pages#index"
    get "pages/index"
    get "pages/vitality"
    get "cities/my_cities"
  
  devise_for :users
  
  resources :salons do 
    resources :notes
    resources :tasks
  end

  resources :cities do 
  	resources :zip_codes do 
  		resources :salons
  	end
  end

  resources :sales_sessions do 
    resources :sales_actions
  end
end
