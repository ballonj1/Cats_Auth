NinetyNineCatsDay1::Application.routes.draw do
  # get 'users/new'
  #
  # get 'users/create'
  resources :users, only: [:new, :create]

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'

  resource :session, only: [:new, :create, :destroy]

  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end

  root to: redirect("/cats")
end
