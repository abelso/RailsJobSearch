Rails.application.routes.draw do
  root to: "jobs#index"
  resources :jobs do
    resources :applications 
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
