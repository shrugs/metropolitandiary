
Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope '/v1', module: :v1 do
      resources :entries
    end
  end

  root to: 'home#index'

end
