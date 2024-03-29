Rails.application.routes.draw do
  root "api/v1/home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api', { format: 'json' }  do
    namespace 'v1' do
      resources :home, only: [:index]
      resources :products, only: %i[index show]
      resources :items, only: %i[index show]
    end
  end
end
