Rails.application.routes.draw do
  root "users#index"
  
  resources :users do
    resources :degrees do
      resources :majors
    end
  end
end
