Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  # get 'users/create'

  # get 'users/update'

  # get 'users/destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Root
  # root '/'

  get '/centers',                       to: 'centers#index'
  get '/centers/:id',                   to: 'centers#show'
  get '/centers/:id/services',          to: 'centers#services'
  get '/centers/:id/populations',       to: 'centers#populations'
  get '/centers/search/:query',         to: 'centers#query'
  get '/centers/geo/:lat/:lng/:radius', to: 'centers#location', :constraints => { :lat => /[^\/]+/, :lng => /[^\/]+/}
  get '/centers/state/:state_abbr',           to: 'centers#state'

  # get '/centers/services/:service'
  # get '/centers/services/:service/geo/:lat/:lng/:radius'
  # get '/centers/populations/:population'
  # get '/centers/populations/:population/geo/:lat/:lng/:radius'

  resources :users

  resources :schools do
    resources :posts do
      resources :comments
    end
  end


  post '/login', to: 'sessions#create'

  get '/flags/:user_id', to: 'flags#show'

  post '/flags', to: 'flags#create'

  delete '/flags/:id', to: 'flags#destroy'


  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
