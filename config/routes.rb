Rails.application.routes.draw do
  resources :items
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
