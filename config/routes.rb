Rails.application.routes.draw do
  # devise_for :users
  # devise_for :users, defaults: { format: :json } 
  # devise_scope :user do
  #   # Redirests signing out users back to sign-in
  #   get "users", to: "devise/sessions#new"
  # end
  # devise_for :users

  # Devise (login/logout) for HTML requests
  devise_for :users, defaults: { format: :html }
  # ,
  #                   controllers: {
  #                     registrations: 'users/registrations'
  #                   }

  # # API namespace, for JSON requests at /api/sign_[in|out]
  namespace :api do
    devise_for :users, defaults: { format: :json },
                      class_name: 'User',
                      controllers: {
                        sessions: 'api/sessions',
                        registrations: 'api/registrations'}
    devise_scope :user do
      post '/users/sign_in' => 'sessions#create'
      get '/users/sign_in' => 'devise/sessions#new'
      delete '/users/sign_out' => 'devise/sessions#destroy'
      post '/users/sign_up' => 'registrations#create'
    end
    # devise_scope :user do
      
    #   # get '/users/sign_in', to: 'devise/sessions#new'
    #   # post '/users/sign_in' => 'sessions#new'
    # end
                    #        skip: [:registrations, :invitations,
                    #               :passwords, :confirmations,
                    #               :unlocks],
                    #        path: '',
                    #  path_names: { sign_in: 'login',
                    #               sign_out: 'logout' }
  end

  get 'welcome/index'
  post 'welcome/index', to: 'welcome#new'
  root "welcome#index"
end

# curl -X POST http://localhost:3000/api/login -H "Accept: application/json" -H "Content-Type: application/json" -d '{"email":"1@gmail.com", "password":"123456"}’

# curl -X POST http://localhost:3000/api/users/sign_in -H "Accept: application/json" \
#    -H 'Content-Type: application/json' \
#    -d '{"user" : {"email":"1@gmail.com","password":"123456"}}'
#    -d '{"email":"1@gmail.com","password":"123456"}'


# 2@gmail.com = eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjkwNDk0MzgxLCJleHAiOjE2OTA0OTc5ODEsImp0aSI6ImI0MDNkOGE3LTNkMjctNDBlZC05MGE5LTMyMTA0MjI2NWEzOSJ9.1tcvgiqGhK04BOtGMe-g2RI9WY-f1DZq6hRNHQrZfXg

# 5cab9a8ac341e4a377a5bda1ab0103f30685c741fc2fe1a762592d08957a15f992fb9b9ae8c377cce8a6af0532752d9e143601660445d248396014497ca904a1

