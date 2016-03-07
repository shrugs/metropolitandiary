
Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope '/v1', module: :v1 do
      resources :users
      resources :entries
      get 'regions', to: 'regions#index'
    end
  end

  root to: 'home#index'

end
