# == Route Map
#
#       Prefix Verb   URI Pattern                       Controller#Action
#      new_ans GET    /quests/:id/answers/new(.:format) answers#new
#              POST   /quests/:id/answers/new(.:format) answers#create
#  edit_answer GET    /answers/:id/edit(.:format)       answers#edit
#       answer GET    /answers/:id(.:format)            answers#show
#              PATCH  /answers/:id(.:format)            answers#update
#              PUT    /answers/:id(.:format)            answers#update
#              DELETE /answers/:id(.:format)            answers#destroy
# quests_index GET    /quests/index(.:format)           quests#index
#       quests GET    /quests(.:format)                 quests#index
#              POST   /quests(.:format)                 quests#create
#    new_quest GET    /quests/new(.:format)             quests#new
#   edit_quest GET    /quests/:id/edit(.:format)        quests#edit
#        quest GET    /quests/:id(.:format)             quests#show
#              PATCH  /quests/:id(.:format)             quests#update
#              PUT    /quests/:id(.:format)             quests#update
#              DELETE /quests/:id(.:format)             quests#destroy
#         root GET    /                                 quests#index
#        login GET    /login(.:format)                  sessions#new
#              POST   /login(.:format)                  sessions#create
#       logout GET    /logout(.:format)                 sessions#destroy
#       signup GET    /signup(.:format)                 users#new
#        users POST   /users(.:format)                  users#create
#

# /quests -- index of quests
#
# /quests/:id - show a single quest with all answers
#
# /quests/:id/answers/new - create a new answer
#

Rails.application.routes.draw do

  root 'quests#index'

  resources :quests do
    resources :answers
  end

  # namespace :api do
  #     namespace :v1 do
  #       resources :sessions, only: [:create, :show]
  #       resources :users, only: [:index, :create, :show, :update, :destroy] do
  #         quests :activate, on: :collection
  #         resources :followers, only: [:index, :destroy]
  #         resources :followings, only: [:index, :destroy] do
  #           post :create, on: :member
  #         end
  #         resource :feed, only: [:show]
  #       end
  #       resources :microposts, only: [:index, :create, :show, :update, :destroy]
  #     end
  #   end

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get '/signup' => 'users#new'
post '/users' => 'users#create'

end
