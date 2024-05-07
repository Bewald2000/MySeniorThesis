Rails.application.routes.draw do
  root "home#home"
  
  resources :users do
    resources :degrees do
      resources :majors
      resources :minors
    end
    resources :work do
    end
    resources :award do
    end
  end
  resource :user_session do
  end
end
