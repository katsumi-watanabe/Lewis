Rails.application.routes.draw do

  namespace :user do
    get 'chat_rooms/update'
  end
# deviseルーティング
  devise_for :users, controllers: {
    sessions: 'user/users/sessions',
    passwords: 'user/users/passwords',
    registrations: 'user/users/registrations'
  }

  devise_for :admins, controllers: {
   sessions: 'admin/admins/sessions',
   passwords: 'admin/admins/passwords',
   registrations: 'admin/admins/registrations'
  }

  # guest-user
  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/users/sessions#guest_sign_in'
  end
  # guest-admin
  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admin/admins/sessions#guest_sign_in'
  end

  # userルーティング

  scope module: :user do
    get 'search' => 'homes#search'
    get 'post_sneakers/search' => 'post_sneakers#search'
    post "relationshops/:user_id" => 'relationships#create', as: "relationships"
    delete "relationshops/:user_id" => 'relationships#destroy', as: "relationship"
    get '/users/:user_id/followings' => 'relationships#followings', as: 'followings'
    get '/users/:user_id/followers' => 'relationships#followers', as: 'followers'
    resources :chats, only: [:create, :show, :edit, :update, :destroy]
    post 'solution/:user_id' => 'chat#:user_id', as: "solution"
    resources :chat_rooms, only: [:update]
    resources :post_sneakers do
    resources :comments, only: [:create, :edit, :update, :destroy]
    resource :like, only: [:create, :destroy]
    end
    resources :activities, only: [:index] do
      patch :read, on: :member
    end
  end

  namespace :user do
    resources :details, only: [:show, :edit, :update]
  end

 # adminルーティング

  namespace :admin do

    resources :users, only: [:index, :show, :edit, :update]
    resources :chats, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :activities, only: [:index] do
      patch :read, on: :member
    end
  end

  root to: 'user/homes#top'
  get '/admins/top' => 'admin/homes#top'

end