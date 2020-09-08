require 'sidekiq/web'

Rails.application.routes.draw do
  
  if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end

  scope :api, format: :json do
    devise_for :users, except: %i[registration sessions]
    devise_for :shops,
                controllers: { registrations: 'users/registrations' }
    devise_for :customers,
                controllers: { registrations: 'users/registrations' }

    get 'me', to: 'application#me'

    resource :cart, only: %i[update show destroy]

    resources :categories, only: %i[index show create] do
      resources :products
    end

    resources :products, only: %i[] do
      resources :reviews, only: %i[index create update delete]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
