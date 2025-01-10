Rails.application.routes.draw do
  root "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards do
    resources :lists do
      resources :tasks
    end
  end
end
