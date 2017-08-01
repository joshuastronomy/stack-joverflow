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

  get 'quests' => 'quests#index'
  get 'quests/:q_id' => "quests#show"

  get 'quests/:q_id/answers/new' => "answers#new", as: :new_ans
  post 'quests/:q_id/answers/new' => "answers#create"


    resources :answers, except: [:new, :create, :index]

  # get 'answers/edit'
  #
  # get 'answers/update'

  # get 'sessions/new'
  # post 'sessions/create'
  #
  # resources :users
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # post 'users/create'
  # post ' users/update'
  #
  # get 'quests/new'
  # get 'quests/edit'
  # get 'quests/show'
  # post 'quests/create'
  # post 'quests/update'

  get 'quests/index'
    resources :quests

  root 'quests#index'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

#These routes are for displaying the signup form and storing the user in the database.

get '/signup' => 'users#new'
post '/users' => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
