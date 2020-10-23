Rails.application.routes.draw do
  devise_for :athletes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :athlete do
        resource :profiles, only: [:create, :show, :update]
        resource :sessions, only: [:create]
        resources :provided_services, only: [:create, :update, :show, :index]
        resources :schools, only: [:create, :index]
      end
    end
  end
end
