# == Route Map
#
#                 Prefix Verb   URI Pattern                                      Controller#Action
#                   root GET    /                                                sessions#new
# auth_facebook_callback GET    /auth/facebook/callback(.:format)                oauthcallbacks#facebook
#               sessions POST   /sessions(.:format)                              sessions#create
#            new_session GET    /sessions/new(.:format)                          sessions#new
#                session DELETE /sessions/:id(.:format)                          sessions#destroy
#     user_user_profiles GET    /users/:user_id/user_profiles(.:format)          user_profiles#index
#                        POST   /users/:user_id/user_profiles(.:format)          user_profiles#create
#  new_user_user_profile GET    /users/:user_id/user_profiles/new(.:format)      user_profiles#new
# edit_user_user_profile GET    /users/:user_id/user_profiles/:id/edit(.:format) user_profiles#edit
#      user_user_profile GET    /users/:user_id/user_profiles/:id(.:format)      user_profiles#show
#                        PATCH  /users/:user_id/user_profiles/:id(.:format)      user_profiles#update
#                        PUT    /users/:user_id/user_profiles/:id(.:format)      user_profiles#update
#                        DELETE /users/:user_id/user_profiles/:id(.:format)      user_profiles#destroy
#                  users GET    /users(.:format)                                 users#index
#                        POST   /users(.:format)                                 users#create
#               new_user GET    /users/new(.:format)                             users#new
#              edit_user GET    /users/:id/edit(.:format)                        users#edit
#                   user GET    /users/:id(.:format)                             users#show
#                        PATCH  /users/:id(.:format)                             users#update
#                        PUT    /users/:id(.:format)                             users#update
#                        DELETE /users/:id(.:format)                             users#destroy
#               artworks GET    /artworks(.:format)                              artworks#index
#                        POST   /artworks(.:format)                              artworks#create
#            new_artwork GET    /artworks/new(.:format)                          artworks#new
#           edit_artwork GET    /artworks/:id/edit(.:format)                     artworks#edit
#                artwork GET    /artworks/:id(.:format)                          artworks#show
#                        PATCH  /artworks/:id(.:format)                          artworks#update
#                        PUT    /artworks/:id(.:format)                          artworks#update
#                        DELETE /artworks/:id(.:format)                          artworks#destroy
#                artists GET    /artists(.:format)                               artists#index
#                        POST   /artists(.:format)                               artists#create
#             new_artist GET    /artists/new(.:format)                           artists#new
#            edit_artist GET    /artists/:id/edit(.:format)                      artists#edit
#                 artist GET    /artists/:id(.:format)                           artists#show
#                        PATCH  /artists/:id(.:format)                           artists#update
#                        PUT    /artists/:id(.:format)                           artists#update
#                        DELETE /artists/:id(.:format)                           artists#destroy
#                 stacks GET    /stacks(.:format)                                stacks#index
#                        POST   /stacks(.:format)                                stacks#create
#              new_stack GET    /stacks/new(.:format)                            stacks#new
#             edit_stack GET    /stacks/:id/edit(.:format)                       stacks#edit
#                  stack GET    /stacks/:id(.:format)                            stacks#show
#                        PATCH  /stacks/:id(.:format)                            stacks#update
#                        PUT    /stacks/:id(.:format)                            stacks#update
#                        DELETE /stacks/:id(.:format)                            stacks#destroy
#

Rails.application.routes.draw do

  root to: "sessions#new"
  get '/auth/facebook/callback', to: 'oauthcallbacks#facebook'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :user_profiles
  end

  resources :artworks, :artists, :stacks

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
