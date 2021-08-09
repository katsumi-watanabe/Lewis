Rails.application.routes.draw do

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

  scope module: :user do
      post "relationshops/:user_id" => 'relationships#create', as: "relationships"
      delete "relationshops/:user_id" => 'relationships#destroy', as: "relationship"
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    resources :post_sneakers do
      resources :comments, only: [:create, :edit, :update, :destroy]
      resource :like, only: [:create, :destroy]
    end
  end

  namespace :user do
    resources :details, only: [:show, :edit, :update]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  root to: 'user/homes#top'
end