# == Route Map
#
#                 Prefix Verb   URI Pattern                                 Controller#Action
#                   root GET    /                                           backbone#index
# auth_facebook_callback GET    /auth/facebook/callback(.:format)           oauthcallbacks#facebook
#               sessions POST   /sessions(.:format)                         sessions#create
#            new_session GET    /sessions/new(.:format)                     sessions#new
#                session DELETE /sessions/:id(.:format)                     sessions#destroy
# edit_user_user_profile GET    /users/:user_id/user_profile/edit(.:format) user_profiles#edit
#      user_user_profile PATCH  /users/:user_id/user_profile(.:format)      user_profiles#update
#                        PUT    /users/:user_id/user_profile(.:format)      user_profiles#update
#         backbone_index GET    /backbone(.:format)                         backbone#index
#               artworks POST   /artworks(.:format)                         artworks#create
#            new_artwork GET    /artworks/new(.:format)                     artworks#new
#           api_artworks GET    /api/artworks(.:format)                     api/artworks#index {:format=>:json}
#            api_artwork GET    /api/artworks/:id(.:format)                 api/artworks#show {:format=>:json}
#                        PATCH  /api/artworks/:id(.:format)                 api/artworks#update {:format=>:json}
#                        PUT    /api/artworks/:id(.:format)                 api/artworks#update {:format=>:json}
#            api_artists GET    /api/artists(.:format)                      api/artists#index {:format=>:json}
#             api_artist GET    /api/artists/:id(.:format)                  api/artists#show {:format=>:json}
#                        PATCH  /api/artists/:id(.:format)                  api/artists#update {:format=>:json}
#                        PUT    /api/artists/:id(.:format)                  api/artists#update {:format=>:json}
#               api_user GET    /api/users/:id(.:format)                    api/users#show {:format=>:json}
#                        PATCH  /api/users/:id(.:format)                    api/users#update {:format=>:json}
#                        PUT    /api/users/:id(.:format)                    api/users#update {:format=>:json}
#         api_home_index GET    /api/home(.:format)                         api/home#index {:format=>:json}
#

Rails.application.routes.draw do

  root to: "backbone#index"

  get '/auth/facebook/callback', to: 'oauthcallbacks#facebook'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [] do
    resource :user_profile, only: [:edit, :update]
  end

  resources :backbone, only: :index

  resources :artworks, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    resources :artworks, only: [:show, :index, :update]
    resources :artists, only: [:show, :index, :update]
    resources :users, only: [:show, :update]
    resources :home, only: [:index]
  end

end

# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

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
