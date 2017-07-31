# == Route Map
#
#         Prefix Verb   URI Pattern                Controller#Action
#   quests_index GET    /quests/index(.:format)    quests#index
#     quests_new GET    /quests/new(.:format)      quests#new
#  quests_create GET    /quests/create(.:format)   quests#create
#    quests_edit GET    /quests/edit(.:format)     quests#edit
#  quests_update GET    /quests/update(.:format)   quests#update
# quests_destroy GET    /quests/destroy(.:format)  quests#destroy
#         quests GET    /quests(.:format)          quests#index
#                POST   /quests(.:format)          quests#create
#      new_quest GET    /quests/new(.:format)      quests#new
#     edit_quest GET    /quests/:id/edit(.:format) quests#edit
#          quest GET    /quests/:id(.:format)      quests#show
#                PATCH  /quests/:id(.:format)      quests#update
#                PUT    /quests/:id(.:format)      quests#update
#                DELETE /quests/:id(.:format)      quests#destroy
#

Rails.application.routes.draw do
  get 'quests/new'
  get 'quests/edit'
  get 'quests/show'
  post 'quests/create'
  post 'quests/update'

  get 'quests/index'
    resources :quests

  root 'quests#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
