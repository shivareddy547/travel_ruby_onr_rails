Rails.application.routes.draw do
  resources :restaurant_attachments
  resources :activity_attachments
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'authenticate', to: 'authentication#authenticate'
get '/api/v1/activities/get_names', to: 'activities#get_names'
  namespace :api do
    namespace :v1 do
      resources :activities
      resources :restaurants
      resources :hotels do
        resources :facilities
        resources :rooms
        resources :bookings, only: [:create, :index]
        resources :sales_module, only: [:index]
      end

      resources :wallet_histories, only: [:index]
      resources :room_bookings, only: [:create, :index]
      resources :invite_code, only: [] do
        collection do
          get :valid
        end
      end
      resources :basics_module, only: [:index]
      resources :users
      resources :search_rooms, only: [] do
        collection do
          get :search
        end
      end
    end
  end

end
