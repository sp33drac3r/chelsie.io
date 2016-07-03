Rails.application.routes.draw do

  # Root
  root to: 'application#index'

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


  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
