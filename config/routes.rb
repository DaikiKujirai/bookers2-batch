Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following_user, :follower_user
    end
  end
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
  resources :relationships, only: [:create, :destroy]
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  get 'search' => 'searches#search'

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create, :destroy]

end