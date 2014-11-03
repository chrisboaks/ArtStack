# == Route Map
#
#                  Prefix Verb   URI Pattern                                  Controller#Action
#                    root GET    /                                            sessions#new
#  auth_facebook_callback GET    /auth/facebook/callback(.:format)            oauthcallbacks#facebook
#                sessions POST   /sessions(.:format)                          sessions#create
#             new_session GET    /sessions/new(.:format)                      sessions#new
#                 session DELETE /sessions/:id(.:format)                      sessions#destroy
# edit_user_user_profiles GET    /users/:user_id/user_profiles/edit(.:format) user_profiles#edit
#      user_user_profiles GET    /users/:user_id/user_profiles(.:format)      user_profiles#show
#                         PATCH  /users/:user_id/user_profiles(.:format)      user_profiles#update
#                         PUT    /users/:user_id/user_profiles(.:format)      user_profiles#update
#                   users POST   /users(.:format)                             users#create
#                new_user GET    /users/new(.:format)                         users#new
#                    user GET    /users/:id(.:format)                         users#show
#                artworks GET    /artworks(.:format)                          artworks#index
#                         POST   /artworks(.:format)                          artworks#create
#             new_artwork GET    /artworks/new(.:format)                      artworks#new
#                 artwork GET    /artworks/:id(.:format)                      artworks#show
#                 artists GET    /artists(.:format)                           artists#index
#                  artist GET    /artists/:id(.:format)                       artists#show
#            api_artworks GET    /api/artworks(.:format)                      api/artworks#index {:format=>:json}
#                         POST   /api/artworks(.:format)                      api/artworks#create {:format=>:json}
#         new_api_artwork GET    /api/artworks/new(.:format)                  api/artworks#new {:format=>:json}
#             api_artwork GET    /api/artworks/:id(.:format)                  api/artworks#show {:format=>:json}
#             api_artists GET    /api/artists(.:format)                       api/artists#index {:format=>:json}
#              api_artist GET    /api/artists/:id(.:format)                   api/artists#show {:format=>:json}
#              api_stacks POST   /api/stacks(.:format)                        api/stacks#create {:format=>:json}
#               api_stack DELETE /api/stacks/:id(.:format)                    api/stacks#destroy {:format=>:json}
#

Rails.application.routes.draw do

  root to: "sessions#new"

  get '/auth/facebook/callback', to: 'oauthcallbacks#facebook'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resource :user_profiles, only: [:edit, :update, :show]
  end

  resources :artworks, only: [:new, :create, :show, :index]
  resources :artists, only: [:show, :index]
  resources :stacks, only: [:create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :artworks, only: [:new, :create, :show, :index]
    resources :artists, only: [:show, :index]
    resources :stacks, only: [:create, :destroy]
    resources :users, only: :show
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
