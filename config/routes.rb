Rails.application.routes.draw do
  get "errors/not_found"
  match "/404", to: "errors#not_found", via: :all
  devise_for :users
  root "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :boards, except: [ :index ] do
    resources :lists, except: [ :index, :show ] do
      resources :tasks, except: [ :index, :show ] do
        patch :move, :check, on: :member
      end
    end
  end

  get "*unmatched_route", to: "errors#not_found"
end
