Rails.application.routes.draw do
=begin
  this will match a GET request to "/hello" url, it will invoke the index method (which is called action)
  with in WelcomeController which is located in app/controllers folder get get({"/hello" => "welcome#index"})
=end

resources :users, only: [:new, :create]

resources :sessions, only: [:new, :create, :destroy] do
  # this will create for s a route with DELETE http verb and /sessions
  #adding the on: :collection opetion will make it part of the routes For
  # sessions which means it won't prepend the routes with /sessions/:session_id
  delete :destroy, on: :collection
end

resources :questions do
  resources :answers, only: [:create, :destroy]
  #resources (:answers, {only: [:create, :destroy]})
  #nesting resources: answers in here makes every URL for answers prepended with /questions/:question_id
end

resources :answers, only:[] do #to eliminate excess answer routes
  resources :feedbacks, only: [:create, :destroy]
end

#post "/questions/:question_id/answers" => "answers#create"

#get "/products/new" => "products#new", as: :new_product
#post "/products" => "products#create", as: :products
#get "/products/:id" => "products#show", as: :product
#get "/products/:id/edit" => "products#edit", as: :edit_product
#get "/products" => "products#index"
#patch "/products/:id" => "products#update"
#delete "/products/:id" => "products#destroy"

resources :products do
  resources :comments, only: [:create, :destroy]
end
#get "/questions/new" => "questions#new", as: :new_question
#post "/questions" => "questions#create", as: :questions
#get "/questions/:id" => "questions#show", as: :question
#get "/questions" => "questions#index"
#get "/questions/:id/edit" => "questions#edit", as: :edit_question
#patch "/questions/:id" => "questions#update"
#delete "/questions/:id" => "questions#destroy"

get "/articles" => "articles#index"
post "/articles" => "articles#new"

root "welcome#index"

get "/hello" => "welcome#index"

get "/contact" => "contact#index"
post "/contact" => "contact#create"

get "/subscribe" => "subscribe#index"
post "/subscribe" => "subscribe#subscribe"

#in order to give a url a URL/PATH helper we provde it with the as: option. The URL helper will be whatever you put in there appeded with _path or url
# this will match any url /hello/something with GET request
# these helpers are accessible
get "/hello/:name" => "welcome#hello", as: :greet #gives helper path when you don't have one
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  #try CITY AND NAME path

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
